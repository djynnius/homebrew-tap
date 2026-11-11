class FerrausPlughostVst3 < Formula
  desc "Out-of-process VST3 plugin host used by ferraus (speaks the same protocol as ferraus-plughost)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-plughost-vst3-aarch64-apple-darwin.tar.xz"
      sha256 "bc72a3e0271f976f2c5220edb8cb1cae3403d2f0980182d8bfe3b85aae0fa155"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-plughost-vst3-x86_64-apple-darwin.tar.xz"
      sha256 "307cf7b62f6e1365960d0ffd702cb09bd1cd2bbe5a71fcaf20aa911bd9d36508"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-plughost-vst3-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5cc6dda9a3b1d808be5b8437d75e81111ab54d6f35ee6648393fb06e41a7464f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.5/ferraus-plughost-vst3-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e031e0e2615df4d9ca7f4a7cb3f6f698bd457e81e322357a7b1bd1184100c006"
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
