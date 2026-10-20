class Ferraus < Formula
  desc "A command-line audio workstation for scripts and AI agents"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.0"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-aarch64-apple-darwin.tar.xz"
    sha256 "a53d1513d13912f7f4a450c9ad33ce639c815c9550eaf5dfdbaccfa7f2b61760"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ac4344a9434cdd9d25cdf53bea4e8555c66e5d9caa8e4b1bae627015ded36550"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3f5ae5bf9cb053b9ab3ffd790b9cd7d13c77d7921e6a542e9f23a5cf9ab92c21"
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
