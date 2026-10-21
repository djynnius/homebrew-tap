class FerrausPlughostVst3 < Formula
  desc "Out-of-process VST3 plugin host used by ferraus (speaks the same protocol as ferraus-plughost)"
  homepage "https://djynnius.github.io/ferraus"
  version "0.1.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-plughost-vst3-aarch64-apple-darwin.tar.xz"
      sha256 "8a10b48a982d970fbca18e5c5ca4517b9f3bc8a5133303ee6401c2cda37ebe2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-plughost-vst3-x86_64-apple-darwin.tar.xz"
      sha256 "5b3e4da03f599e0d820089be8b0c655cf300bb5588c5d586ee34296fef412ac9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-plughost-vst3-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "aa914394f7f25f5c0546c840a9adff9680ef678aa9674d3a651340c2586ec2d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/djynnius/ferraus/releases/download/v0.1.2/ferraus-plughost-vst3-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "df78805241f11d9b4710231ce005d1a066fc119f111413774c5fbe04a17c4417"
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
