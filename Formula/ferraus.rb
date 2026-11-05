class Ferraus < Formula
  desc "A command-line audio workstation for scripts and AI agents"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.3/ferraus-aarch64-apple-darwin.tar.xz"
      sha256 "acba7f403bc038cf483403ab39872a144f802a8f967dfc452d86f536a105d262"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.3/ferraus-x86_64-apple-darwin.tar.xz"
      sha256 "987ec24fda2bc9ba2fddca70728c9dc16a69d6fad5a4f44c3dd0c497ec3fe6ef"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.3/ferraus-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "880946a4dc66f6addb4e954bbfc6c433ed599507429d5a2e2999b470eb5d3f6c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.3/ferraus-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c9bf874b8cb8fbb2d9dea382a969f3f522b6e75a1a8c6eb7b19b8d616239c98d"
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
