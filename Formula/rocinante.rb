class Rocinante < Formula
  desc "Terminal coding agent for local models with MCP, LSP, and subagents"
  homepage "https://github.com/djynnius/rocinante"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.2/rocinante-aarch64-apple-darwin.tar.gz"
      sha256 "897ab14152585fe1b4864fcfec0b91b442042bf087697259ef7fe0879f984eaf"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.2/rocinante-x86_64-apple-darwin.tar.gz"
      sha256 "7e85914c24954f7f873b0141bf55dd983f6aea60bfe70555f2d61dab9a59bb82"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.2/rocinante-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c8e550e7a8c14dae29204a19aa9b46af3337e134d30f83af99d7fa5e1a8bd27c"
    end
    on_intel do
      url "https://github.com/djynnius/rocinante/releases/download/v0.4.2/rocinante-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3686166fd707b6ef652bfec13fd68700d10780de1231856fa9d55343aa400339"
    end
  end

  def install
    bin.install "rocinante"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rocinante --version")
  end
end
