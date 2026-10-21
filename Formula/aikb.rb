class Aikb < Formula
  desc "Command-line client for AI KB knowledge bases, built for agents"
  homepage "https://ai-kb.matherly.net/docs/05-clients/02-cli"
  version "2026.10.21.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_arm64.tar.gz"
      sha256 "544c813d4217c450c3155a509c5b33c9b5764f9f73d7ec43d6c9d5aeb2d08de9"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_amd64.tar.gz"
      sha256 "23878b1798bd1be470e08becfbd0498c00c1f1b84c23605ba53b7fdaffc0d1b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_arm64.tar.gz"
      sha256 "0bf54f1f5741e6521c89db850819ca4f3a5777b7ad37b5b08dd6273f8d0eafa4"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_amd64.tar.gz"
      sha256 "be2652412eda56697b85dd1adcab42957db3e62525ba4048de8475f83db6d0ca"
    end
  end

  def install
    bin.install "aikb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aikb --version")
  end
end
