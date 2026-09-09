# This file is automatically edited by ../update.sh
class Wild < Formula
  desc "Fast linker for Linux"
  homepage "https://github.com/wild-linker/wild"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9d670e41f76481a68984f816e25bd2f124664db3ac935053e1a6fc41d2894c2"
    end

    on_intel do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "641265506a7c06cfb03181b8916ab663ec8407855db6d4db7f8450667d105283"
    end
  end

  def install
    raise "Support for non-Linux platforms not yet available" unless OS.linux?

    bin.install "wild"
    bin.install_symlink "wild" => "ld.wild"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wild --version")
    assert_match version.to_s, shell_output("#{bin}/ld.wild --version")
  end
end
