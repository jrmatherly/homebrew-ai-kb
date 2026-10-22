class Aikb < Formula
  desc "Command-line client for AI KB knowledge bases, built for agents"
  homepage "https://ai-kb.matherly.net/docs/05-clients/02-cli"
  version "2026.10.22.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_arm64.tar.gz"
      sha256 "68d4e9e679635e6cd256bf52679dff0198cc73f4a16886761c05ce7387ea65bb"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_amd64.tar.gz"
      sha256 "3b8d503cd9d02929f0f8d1cdfa8b8dc3f174bd60d7effb1d056dbf50b1edc27e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_arm64.tar.gz"
      sha256 "abeaf9fdc18bb74c58a86dd6b4f3cc479cb7a7330f90fb6581fe455418a241bd"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_amd64.tar.gz"
      sha256 "59a18dcfa80ebe812d2e0dfe4748fc9e5b92a15e559d4b47c14696f76c67a5d0"
    end
  end

  def install
    bin.install "aikb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aikb --version")
  end
end
