class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.3.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "dedd5e39cfd7a568e9148fa1dc84fb46cda8e9b1c29168a0dfe0840230f353da"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.3.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "9c15f0e22728da8ebd42e723763ff5b6bea716a3ed4424408f9f184d31eb9b41"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.3.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8c00c52f2f3e61b148fb3e9fd2ceb6812293e8a68323e67cbed80919543a6f9c"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.3.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1ab8c907d2af62dc7920ff28b78dc0df9ac3e32f4bcdf3b8bb702ccb8e121992"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
