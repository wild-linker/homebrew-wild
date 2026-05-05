#!/bin/bash
set -eu


cat <<EOF > Formula/wild.rb
# This file is automatically edited by ../update.sh
class Wild < Formula
  desc "Fast linker for Linux"
  homepage "https://github.com/wild-linker/wild"
  version "$VERSION"
  license any_of: ["MIT", "Apache-2.0"]
  depends_on :linux

  on_linux do
    on_arm do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "$ARM_SHA"
    end

    on_intel do
      url "https://github.com/wild-linker/wild/releases/download/#{version}/wild-linker-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "$X86_SHA"
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
EOF
