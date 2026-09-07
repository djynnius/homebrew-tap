class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.19.0/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "4aa162052eb2b3f3df8bb03fde2478d186669f4c51a2ec4a8e29c0229f1bbc49"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.19.0/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "7641f509b54906e04434c75aaca6e64483432f7017a9401da2b2dc13057bea36"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.19.0/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c09119803dda98dd8f280ec336020107d403678660e16b6d025a7f62cd6860d1"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.19.0/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7d75e6ba13de161fe98d11d8c465c692ed138f96391578c6bf5bd9ecf978fea8"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
