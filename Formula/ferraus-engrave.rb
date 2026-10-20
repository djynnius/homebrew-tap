class FerrausEngrave < Formula
  desc "Engraving helper for ferraus: MusicXML/MEI in, SVG/PDF/PNG out, via Verovio (LGPL-3.0, isolated in this executable)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.0"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-engrave-aarch64-apple-darwin.tar.xz"
    sha256 "7127918bbd69bd023ac1794dec013073c52d4ca8606ad021fdffeaf4e098da52"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-engrave-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d453b9c6520473dc58791ceced430e57604af9d1ec1453908610fed3c0226b0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.0/ferraus-engrave-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4a3d9a3a0636d4b763b122acf01a403d9f7722ad780e953da924f256f4e0a1d9"
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
