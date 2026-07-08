class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "1e6eb4076626ea16e6fe2780be6afe9989838f178e578ccc1839751d78a9345d"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "f6bf56cc6c21caf2d1207456a172a688ca48fef591b72b2682aa30e8f9e57f53"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa8d0bb33a7fa26f9734bdcd7282f4feb988aeb4c7038305d503cd1da69950d4"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.3.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2900e3cd778d5b920dad6add0b06b1983235ae7265f836b436bc880a5cb9cd9b"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
