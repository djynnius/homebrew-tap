class Ferraus < Formula
  desc "A command-line audio workstation for scripts and AI agents"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-aarch64-apple-darwin.tar.xz"
    sha256 "cac30f7b87829bbf231d9e17dbcc80668b54d85b1a8cbf1cb2b8a83bdfd73721"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "75759ccc2fcd946ef83f9617bd089dcbf5b7f50ebc7b0f8da7f2a23d497363e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5fbd59a4519816389b24557207c8af4c543e61fff414fc71c66e41eaf3af97d5"
    end
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ferraus", "ferraus-plughost"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ferraus", "ferraus-plughost"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ferraus", "ferraus-plughost"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
