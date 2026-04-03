# typed: false
# frozen_string_literal: true

class MegaportCli < Formula
  desc "CLI tool for managing Megaport network infrastructure"
  homepage "https://github.com/megaport/megaport-cli"
  version "0.5.7"
  license "MPL-2.0"

  on_macos do
    on_intel do
      url "https://github.com/megaport/megaport-cli/releases/download/v#{version}/megaport-cli_#{version}_darwin_amd64.zip"
      sha256 "3f5655312124d515e1a883ec8886ff0dfc29c717f18e323043546fd28896697e"
    end

    on_arm do
      url "https://github.com/megaport/megaport-cli/releases/download/v#{version}/megaport-cli_#{version}_darwin_arm64.zip"
      sha256 "ca1d3072c50c1f854acf1af1a6703ff3fe97df18d218f26f5cecae002f5ce5d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/megaport/megaport-cli/releases/download/v#{version}/megaport-cli_#{version}_linux_amd64.zip"
      sha256 "932d0d2b281fb970d6f87c45015ba83a910e62d776371b05457a9c76c8d54164"
    end

    on_arm do
      url "https://github.com/megaport/megaport-cli/releases/download/v#{version}/megaport-cli_#{version}_linux_arm64.zip"
      sha256 "c625f0292dde28c1f8d146a7874cc98f50e331b9f5dbbc71a74b6ddb194296c8"
    end
  end

  def install
    # GoReleaser names the binary with version suffix in release builds
    if File.exist?("megaport-cli_v#{version}")
      bin.install "megaport-cli_v#{version}" => "megaport-cli"
    elsif File.exist?("megaport-cli")
      bin.install "megaport-cli"
    else
      bin.install Dir["megaport-cli*"].first => "megaport-cli"
    end
  end

  test do
    assert_match "Megaport CLI Version", shell_output("#{bin}/megaport-cli version")
  end
end
