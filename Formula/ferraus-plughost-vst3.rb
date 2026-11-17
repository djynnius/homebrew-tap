class FerrausPlughostVst3 < Formula
  desc "Out-of-process VST3 plugin host used by ferraus (speaks the same protocol as ferraus-plughost)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-plughost-vst3-aarch64-apple-darwin.tar.xz"
      sha256 "5144b90ae1825042225322f8c5ec11214d94115d8447f86873139c83afa435c9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-plughost-vst3-x86_64-apple-darwin.tar.xz"
      sha256 "5db054b2f7edf943c4ab2ae1c7d68872882521078921e04fc446910131982e94"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-plughost-vst3-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5ba0a6999b3ea32c7f31d304963b6375923c5318833744c36e5f280f390a72f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.6/ferraus-plughost-vst3-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c0aa58edb1894a3d92a6cd88a809856ae0e8b1ddf369f013fda8a395a1753fa2"
    end
  end
  license any_of: ["Apache-2.0", "MIT"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-pc-windows-gnu":    {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
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
    if OS.mac? && Hardware::CPU.intel?
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
