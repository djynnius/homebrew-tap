class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "fc9dadb43cc6fc2786efdb76d0e3efc948dece46d992de6bfc4da1732eef3433"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "47bdc423114556722150dfe3663003d9d83a23b2a418238641efd1c4f57d86c2"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5fa1c012a7a8959aee8c923a8966aabb16d565fc9aabeec9bcca216497024be6"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fe4b947ab0e2cd768416383a670b114d6630e24965f1965e31730e10917ed2bd"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
