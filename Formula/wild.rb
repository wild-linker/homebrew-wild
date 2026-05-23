# This file is automatically edited by ../update.sh
class Wild < Formula
  desc "Fast linker for Linux"
  homepage "https://github.com/wild-linker/wild"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8855a347b9dfbc762e2492125ee82d09313124da3be616b1cd027a14eddfe8c0"
    end

    on_intel do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "deb6ee0e5caec798053ec4aafaba042e20a8edf91f08cb4d36268571cc628d3b"
    end
  end

  def install
    raise "Support for non-Linux platforms not yet available" unless OS.linux?
    bin.install "wild"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wild --version")
  end
end
