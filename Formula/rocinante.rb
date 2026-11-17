class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.2.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "c84aa07ff58774f980c0e6df2569b8cda2e9c0f68b9c94c32249660153312a0b"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.2.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "f4173755aa8a2d5869183d1c763972ae93816c9ca8d8eeeb3e8854cdfba68288"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v1.2.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "21e2d90aa5f1fc158524c0760ca2da731ea7ef479d971e121c7ac529915ce146"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v1.2.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fdecf0ed40c372f21ac5cc4419d7b46bf5c9ae30fa46760cb020959d55767f0a"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
