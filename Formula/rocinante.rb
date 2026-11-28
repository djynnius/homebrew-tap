class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "68c081be3ad10a514a7e56dc0f6c61ea66551ad0fadccfb5276877b6cd02297c"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "8fce5abf4c07d96d9c17430154238cd8ce27cc738696661dddb681f222dc9b04"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33d81deff2315b4724ab0b4581fc9c7517501e0ebab05725e845c218faed79cb"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bc8c6a8d7a55046106d44f5a39e379ed9f08d8c425ba49eeb45172773a64cee1"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
