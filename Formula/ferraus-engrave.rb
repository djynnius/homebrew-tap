class FerrausEngrave < Formula
  desc "Engraving helper for ferraus: MusicXML/MEI in, SVG/PDF/PNG out, via Verovio (LGPL-3.0, isolated in this executable)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-engrave-aarch64-apple-darwin.tar.xz"
    sha256 "6fd4e7a0f2a2605501ee287b7f11c20df8f3d35acc29b876283bfd556698e681"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-engrave-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a1dc5756e8ec42b07ed9e74685cf3d8398d4bccf6d4a1333153f1b445aebfe21"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-engrave-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "44d33acb20bae3ca5cf94f40e0480894cb56f85221625d25c118396a1c175779"
    end
  end
  license "LGPL-3.0-or-later"

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
      bin.install "ferraus-engrave"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ferraus-engrave"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ferraus-engrave"
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
