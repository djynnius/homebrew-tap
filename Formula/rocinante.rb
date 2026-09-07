class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.20.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "cb1f405473aac38e16bd39069a34de4ee6c7efcb2263a60ad59e271ff7ecd5e9"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.20.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "6903509117a713e1ebec3f49673d5f1f8ef119013838a5ce4bb0f8eafd6c3035"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.20.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7f3baf1731d67d43fd3c731a8f606815dc027e623cf21a39d65819eeb4afa1c1"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.20.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d4a90e387c8830e1656655b7796ad7e2334d47883c4deddecd881298fcae1e51"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
