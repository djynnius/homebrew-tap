class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.17.1/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "4a193e10706218211a0d8c0caf0b7f6660ea0ca9f6d3145ceef31670606e0dbe"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.17.1/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "01de597fe04cea408dbac93484d33ae73e9282ca2830707c3776de9f8d7afe36"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.17.1/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0917908531e2b191f5afd71baa54aeaf821c79d68f3c7f2e21961eec627b90a2"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.17.1/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3af7fcbd35abc5778aae18a7dcdc6b2e1a72ed537684064a55007459a2f450a"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
