class Aikb < Formula
  desc "Command-line client for AI KB knowledge bases, built for agents"
  homepage "https://ai-kb.matherly.net/docs/05-clients/02-cli"
  version "2026.10.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_arm64.tar.gz"
      sha256 "dd8db36a97b61b02164244877c44cfb2cf310643b073e21b21b150ac0f14b6ac"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_darwin_amd64.tar.gz"
      sha256 "23e2f3649769ffc63e3b34df05a86fc6474abdc40a3d872ff591701f494fd836"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_arm64.tar.gz"
      sha256 "d688d0ecc4173458fb4d66bd96b8d8abdafeffd8aee7056a659916e81e1395ee"
    end
    on_intel do
      url "https://github.com/jrmatherly/ai-kb/releases/download/v#{version}/aikb_v#{version}_linux_amd64.tar.gz"
      sha256 "f1b8a577a4d31a45c75f49d6528c66598c3abb950f7377028ed182e129d82955"
    end
  end

  def install
    bin.install "aikb"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aikb --version")
  end
end
