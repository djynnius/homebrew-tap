class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.1/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "79c9bf7654936d4dca8aa06eae44441167536e7a3c3855e6fa2cb15625520a90"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.1/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "dae1e558be4815ba7a5a873b44b7c936993c8973c9017f49a63dadefc3314610"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.1/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cd48f55e8363d9a29b3526bfdac7c7b7f519c12770a49053d8a22846662fb9db"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.6.1/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "32bcbd0e280cc0aa772254f1265abc427f4077d22915a67f23191c66632da625"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
