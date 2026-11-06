class FerrausPlughostVst3 < Formula
  desc "Out-of-process VST3 plugin host used by ferraus (speaks the same protocol as ferraus-plughost)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-plughost-vst3-aarch64-apple-darwin.tar.xz"
      sha256 "b18ef45d242148c37e81f9bbf0a8c7043e46dcb31ec040ae61a9c957d7068a9d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-plughost-vst3-x86_64-apple-darwin.tar.xz"
      sha256 "413c281c07910ef6912375a1d444e89318c00e4a5e98ad36c6ffe39e33b5aedd"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-plughost-vst3-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "abbba82d1bb378771a049e702578821c03828d27ba096130998536558707853b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.4/ferraus-plughost-vst3-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f8775850e023bedd9357fbafd2721a68bc3317ee8908a0ceab9bfd61b162fe1e"
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
