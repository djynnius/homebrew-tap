class FerrausPlughostVst3 < Formula
  desc "Out-of-process VST3 plugin host used by ferraus (GPLv3; speaks the same protocol as ferraus-plughost)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.1"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-plughost-vst3-aarch64-apple-darwin.tar.xz"
    sha256 "586cea814eb8fbb1fc4c5a4fa4f3414b723479b66ebd9246e6e2658e786c7f50"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-plughost-vst3-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "be6a923f08c0e38acfc33341b7ecd66dcc40387e4d2f4270bb012671291c09d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.1/ferraus-plughost-vst3-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5e3d3b2a0d1f7a554b38b793e733e38189ab71b2eff73ae554f74714ff487861"
    end
  end
  license "GPL-3.0-only"

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
      bin.install "ferraus-plughost-vst3"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "ferraus-plughost-vst3"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "ferraus-plughost-vst3"
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
