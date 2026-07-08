class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.1/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "2bb4f838950e60035a1645bfaf4e774a58962a3d0724cac6665f4e84313a9a90"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.1/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "9f691fdfe20b3df4f0e8682d25c94c81dde9cdcfbd740af5f1708aa3eef9308c"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.1/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "46aa56498ad5cb38efcf84f58968a4ec944146fa45a8d51ab53b85b0fb9cbbe8"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.1/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7578933e6174d6d6e9810b22764d9871f4b0251f26ed097e4d426162ce2fbc1a"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
