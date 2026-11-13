class Aikb < Formula
  desc "Command-line client for AI KB knowledge bases, built for agents"
  homepage "https://ai-kb.matherly.net/docs/05-clients/02-cli"
  version "2026.11.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_arm64.tar.gz"
      sha256 "2c9303faad1bf3d5f9543e9bcf7ac028da88c80d48aed48c676ebf8b4dc17eb1"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_amd64.tar.gz"
      sha256 "edcecd4b64d2fe9970902c08e8c0781c1a27988116c8c6f592f6d0e5793f4fbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_arm64.tar.gz"
      sha256 "d12a904dfaaa3b63f8f331186a1cac0f4bd7acae72a58e26e68475e1047d9e88"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_amd64.tar.gz"
      sha256 "d2b4971f9612816f9cec5502d4291234c8cec690c61122fef4517f1f98c366f9"
    end
  end

  def install
    bin.install "aikb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aikb --version")
  end
end
