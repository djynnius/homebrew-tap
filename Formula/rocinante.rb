class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.22.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "3e705b04ce36be78ce7b493be26b42e92efeb957c345f1ccfd813f4f135ecf05"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.22.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "9fb234feaa7811cac3c94aabe3105b8deed806aff95e6478850bfa5f94cb86a2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.22.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "529dc8a2c8083b3515358cd46782d9954b1eee17c8ab7ca2aa5b35ad4cbe6c47"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.22.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b88073105951b43793cd10f85a347c6b15eeb0f1aa91ec51a9a0601e6333c0d7"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
