class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.18.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "e0cae513904d347eb07b440f74739b9edee8b8492fa62f7035fe0f628c373782"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.18.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "781f1e2de830ed6fe158509ef7bf829aacf9476231ff93fa0632ead7279323b2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.18.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e1b5c37a8186ce8361001f75bbd42579c62f9a7d0d6fe6fc5a517a39b469d0f9"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.18.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bbc46979761a398e7c65888ab14dd42cfd78eb154b899207c0dd7905335e3e3b"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
