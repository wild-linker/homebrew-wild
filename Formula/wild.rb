class Wild < Formula
  desc "Fast linker for Linux"
  homepage "https://github.com/wild-linker/wild"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4de1727db12347c6fbb9fbf67a4b0f15e0344e6de8bb3c0143876d2464143861"
    else
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44ed25fff3657ca62c25a441e60861d4a4061b44c096b998699cc86fa596490b"
    end
  end

  def install
    raise "Support for non-Linux platforms not yet available" unless OS.linux?
    bin.install Dir["*/wild"].first
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wild --version")
  end
end
