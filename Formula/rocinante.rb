class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.4.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "d5c036e0fce1d49a955578476a80baee6c507dc3a5e383ecfb78068711b101c6"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.4.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "184b14d95468e41bbcd746e179ce3831f2ff4cf0818d2c1903635c3513d7e9af"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.4.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ca85812f9263fc3df9cbd1d5250f0b228ed8618bb4a01e41203afe8ab73f6b9"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.4.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1fce9357e7cf49bef929533d1251dcf19a6955bf45036d045c0df6252b777815"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
