class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.5.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "97549ffd3ba89b213eefa94b5a9173c244a6568d60868766928836fbe2f9dcae"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.5.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "4707c0ba2c0eddecf064e8ca7017f4763e0aeede037c1850f7183843ff01a580"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.5.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "53348f186778ef3ed0de92e29e5367b70dea7c80e79b6d9ba86f9e7138013201"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.5.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cfbca1e2e81527f7107968f727513a67dc841375a71c5a0ff4f0bc87a6f67c6c"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
