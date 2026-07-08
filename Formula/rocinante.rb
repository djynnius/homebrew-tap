class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.3/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "b7ccec611395aca77715b2112d0950fe62ecff57e51efe7feb157499b1fd7510"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.3/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "81df86af68ab8cb6a4fd04314e8952c3884099e4a3d7d81afd61fbe2db3198c1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.3/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "00bcedfc457875c666808a688fa96ee7fb6546b51137a2a8cb7bc2945cac79bc"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.3/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9441f78082ddfe0d7b7ab398da868b7fb0a3ae358f86ade13a5f34d5e266cd6c"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
