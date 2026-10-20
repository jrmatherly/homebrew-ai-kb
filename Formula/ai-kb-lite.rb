class AiKbLite < Formula
  desc "Knowledge base management system, single-binary Lite edition"
  homepage "https://github.com/jrmatherly/ai-kb"
  version "2026.10.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/ai-kb-lite_v#{version}_darwin_arm64.tar.gz"
      sha256 "276841ab42fd4a1c9134efeb4a7174e71a7805582c18428a190416fdc8f15834"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/ai-kb-lite_v#{version}_darwin_amd64.tar.gz"
      sha256 "a9713470e14a94339facc0b2939018399f2d8976430a63d303b5a53bd647bb15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/ai-kb-lite_v#{version}_linux_arm64.tar.gz"
      sha256 "638fa8ee06b5da76c2ff766a7ef7fd864ba5eb78a2316125260be2edb075a60a"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/ai-kb-lite_v#{version}_linux_amd64.tar.gz"
      sha256 "7e35da0b62a84b88dcdaf9dc704be4d39554bfc659a0ebc909e604ffd2f6ff03"
    end
  end

  def install
    libexec.install "ai-kb-lite"
    pkgshare.install "web" if File.directory?("web")
    pkgshare.install "config" if File.directory?("config")
    pkgshare.install ".env.lite.example"
    doc.install "README.md"
    pkgshare.install "migrations" if File.directory?("migrations")

    (bin/"ai-kb-lite").write <<~SH
      #!/bin/bash
      CONFIG_DIR="${AIKB_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/aikb}"
      DATA_DIR="${AIKB_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aikb}"

      mkdir -p "$DATA_DIR/files" "$CONFIG_DIR/config" 2>/dev/null

      if [ ! -f "$CONFIG_DIR/config/config.yaml" ]; then
        cp -r "#{pkgshare}/config/" "$CONFIG_DIR/config/"
      fi

      if [ ! -d "$CONFIG_DIR/migrations" ] && [ -d "#{pkgshare}/migrations" ]; then
        ln -sf "#{pkgshare}/migrations" "$CONFIG_DIR/migrations"
      fi

      if [ ! -f "$CONFIG_DIR/.env.lite" ]; then
        cp "#{pkgshare}/.env.lite.example" "$CONFIG_DIR/.env.lite"
        sed -i.bak -e "s|DB_PATH=.*|DB_PATH=$DATA_DIR/aikb.db|" -e "s|LOCAL_STORAGE_BASE_DIR=.*|LOCAL_STORAGE_BASE_DIR=$DATA_DIR/files|" "$CONFIG_DIR/.env.lite"
        rm -f "$CONFIG_DIR/.env.lite.bak"
        echo ""
        echo "Created config file: $CONFIG_DIR/.env.lite"
        echo "Edit it as needed (for example the LLM endpoint or the secret keys)."
        echo ""
      fi

      set -a
      source "$CONFIG_DIR/.env.lite"
      set +a

      export DB_PATH="${DB_PATH:-$DATA_DIR/aikb.db}"
      export LOCAL_STORAGE_BASE_DIR="${LOCAL_STORAGE_BASE_DIR:-$DATA_DIR/files}"
      export AIKB_WEB_DIR="${AIKB_WEB_DIR:-#{pkgshare}/web}"
      # The aikb CLI keeps its own config.yaml in $CONFIG_DIR; name the server
      # config explicitly so the search order cannot pick that file up.
      export AIKB_CONFIG_FILE="${AIKB_CONFIG_FILE:-$CONFIG_DIR/config/config.yaml}"

      cd "$CONFIG_DIR"
      exec "#{libexec}/ai-kb-lite" "$@"
    SH
  end

  def post_install
    (var/"aikb").mkpath
    (var/"log").mkpath
  end

  service do
    run [bin/"ai-kb-lite"]
    keep_alive true
    working_dir var/"aikb"
    log_path var/"log/ai-kb-lite.log"
    error_log_path var/"log/ai-kb-lite.log"
  end

  def caveats
    <<~EOS
      Run in the foreground:
        ai-kb-lite

      Background service (recommended):
        brew services start ai-kb-lite   # start now and at login
        brew services stop ai-kb-lite    # stop
        brew services restart ai-kb-lite # restart
        brew services info ai-kb-lite    # show status

      Logs:
        #{var}/log/ai-kb-lite.log

      The first run creates the config file:
        ~/.config/aikb/.env.lite

      Data is stored in:
        ~/.local/share/aikb/

      To change the config (LLM endpoint, secret keys and so on):
        $EDITOR ~/.config/aikb/.env.lite
        brew services restart ai-kb-lite
    EOS
  end

  test do
    assert_predicate bin/"ai-kb-lite", :executable?
  end
end
