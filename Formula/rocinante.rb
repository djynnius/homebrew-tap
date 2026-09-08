class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.21.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "a5ab12afe483d09d065d2cbe8e3dc111f653c78a3e9db816ebf97d3f86bff277"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.21.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "0337fcc77ed25355d2e5d0ff799e82bd5b9cad1250a18414a1858160319e5868"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.21.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "43cf15d0482314041db6f1480b74883ba0ea4d2f1ff44e8a86d5622a00675c94"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.21.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e72e5712e79a6667edf1831f659843365156e58a9c7b1965d19115142ace980"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
