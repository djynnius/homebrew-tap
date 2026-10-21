class FerrausEngrave < Formula
  desc "Engraving helper for ferraus: MusicXML/MEI in, SVG/PDF/PNG out, via Verovio (LGPL-3.0, isolated in this executable)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-engrave-aarch64-apple-darwin.tar.xz"
      sha256 "b9c617cf391ab83cfa6432c2e9c9a7d986b9c793285fdf165bf24568dcc5c671"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-engrave-x86_64-apple-darwin.tar.xz"
      sha256 "3436b78df4ccb5cfa586f262c07fb91155e41a48259ed169105059651cbd8b42"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-engrave-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b7369be8a0d02fcc9fc0340afb736abd8a6c1525f1e0a6ddb2e859e935c0abec"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-engrave-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "31ac5018e0404a6cb8323275a19925562d3968831e672e4c55b7024969e3d4f4"
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
