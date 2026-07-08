class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.1.2/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "7c6dd391fd43726f7e0b18cb7734d43b9056138f5b647a671a464cd5789939d5"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.1.2/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "1495f7a251cbfada31035cefabcb0c6272d54672db6166a060c0fbf3f96865eb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.1.2/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "08cec34369ce819084d91ca40e99f2e90cee084c749d040eb3e032ac0303fd65"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.1.2/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3d5faf48d73b4a23ed9754fdd4d49ee4d58639dd1e731b6078ecb15ec72b7cfb"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
