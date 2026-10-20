class Aikb < Formula
  desc "Command-line client for AI KB knowledge bases, built for agents"
  homepage "https://ai-kb.matherly.net/docs/05-clients/02-cli"
  version "2026.10.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_arm64.tar.gz"
      sha256 "5c78b2be3c20b4ecfc616395f8d8812af6c786a6833d426fda4359ed42c36612"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_amd64.tar.gz"
      sha256 "2ed08b2fa2c6b9a29b9725a9e4a3b7104290b80244f740209a5e8601a7a3a585"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_arm64.tar.gz"
      sha256 "468a2a72d9d6f9c83e7595d826954b53f44917d857ad025f93ee6de3b3daa186"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_amd64.tar.gz"
      sha256 "66b7b7781304d480bf5fcf24420a4b719a47e3dbc4a8f9b58832a330b29b1330"
    end
  end

  def install
    bin.install "aikb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aikb --version")
  end
end
