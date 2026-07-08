class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.2.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "6aa8b244a0c7509e901ab5bbae31c18ba3d3e579e24cba95e5eb3e27c324d8c7"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.2.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "77808e92de53f210390af57247b3b4ae3126b15e1f27b26fa217a72d99140c4d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.2.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c7eed0f6e72d7140ecccf8fe93a409217ed89fbcf702eb454be9322f57da565"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.2.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "813842b5acfb267dbef1c689a62f2528d9c51d1a245ea8b4a2cd7da727b577aa"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
