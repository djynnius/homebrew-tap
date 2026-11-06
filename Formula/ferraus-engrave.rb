class FerrausEngrave < Formula
  desc "Engraving helper for ferraus: MusicXML/MEI in, SVG/PDF/PNG out, via Verovio (LGPL-3.0, isolated in this executable)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-engrave-aarch64-apple-darwin.tar.xz"
      sha256 "19e95413504c181dfc9c60ebd12448f77b4cbaadfdebe2c52fca623c5319d869"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-engrave-x86_64-apple-darwin.tar.xz"
      sha256 "3d199ec3d4eda824c0de161486f6092a980491ae24590549f5678e0046a25792"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-engrave-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "601b76e8c6d4d3a7076aab34f84ca06fe5e5a128e59a33343e936dc7572ac6e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-engrave-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0cd73e99dcea6b567c6fd567aa255cacb59a9d04f0162bb54f9536aa55e7e760"
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
