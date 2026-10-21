class Ferraus < Formula
  desc "A command-line audio workstation for scripts and AI agents"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-aarch64-apple-darwin.tar.xz"
      sha256 "748137f554ba704f65d7ffd1cd1237d261a44cb10e72320829086f6603d753da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-x86_64-apple-darwin.tar.xz"
      sha256 "0daaad31f34cd24b383fcc237b14036a81c6eada83418794d2935d14e35d1d7f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ad400008023e283487dd1b8897cb04311aa1774eba4c05aa2f73355a8992ded5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "def14a57a074574c3f58820dd52c118a7f7b8617a4c09561a082579e0a14526e"
    end
  end
  license any_of: ["Apache-2.0", "MIT"]

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
      bin.install "ferraus", "ferraus-plughost"
    end
    if OS.mac? && Hardware::CPU.intel?
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
