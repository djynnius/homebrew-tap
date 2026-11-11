class Ferraus < Formula
  desc "A command-line audio workstation for scripts and AI agents"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-aarch64-apple-darwin.tar.xz"
      sha256 "24b0ee716b4af67d8cab2f7b745e1513ee2d85ea589020c634aed72ad576631c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-x86_64-apple-darwin.tar.xz"
      sha256 "b5733ab17fd673a1fcd640765b6340c043b3b68e1e1378acff1f57fb1ecd203b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "46de65402c2ac7bfa2a757f362ac54fe388f0aeb3ad13d5704a9ebf9b02afb28"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "340de11e3130783f5942c08a0059f3862a641f485c447a300f81c9f27914d71d"
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
