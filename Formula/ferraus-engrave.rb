class FerrausEngrave < Formula
  desc "Engraving helper for ferraus: MusicXML/MEI in, SVG/PDF/PNG out, via Verovio (LGPL-3.0, isolated in this executable)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-engrave-aarch64-apple-darwin.tar.xz"
      sha256 "6b563bcfd322258e3e840128ea54955a665a491de40509100f82223f43185530"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-engrave-x86_64-apple-darwin.tar.xz"
      sha256 "d1103e70f6d0694351d938aaa06edc7626fa42708b22ad949a174cc5fe1d230f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-engrave-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "aebaac8e5b4a5c6f75cb1dd3a67367dd58201551538d6d4b506ba8bf37700cef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-engrave-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "244ae056c2611df6c8975d2e1d4c46df409fdb4f17615149923ffb0b473b18bf"
    end
  end
  license "LGPL-3.0-or-later"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-pc-windows-gnu":             {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
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
    if OS.mac? && Hardware::CPU.intel?
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
