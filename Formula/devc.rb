class Devc < Formula
  desc "A simpler alternative to the Dev Containers CLI"
  homepage "https://github.com/rameshvarun/devc"
  version "0.5.0"

  on_macos do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.5.0/devc-0.5.0-darwin-x86_64"
      sha256 "818dc96f5297943e6f98cd1aa99ba2449077258f452c49b63f57ac432d9ac5ab"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.5.0/devc-0.5.0-darwin-arm64"
      sha256 "851eb515d85311902a4ad976daf8e4dc29efc40a9d3193a96fc6d47219fdea78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.5.0/devc-0.5.0-linux-x86_64"
      sha256 "e89992972d10ec39ab016241ddf08e2ffde5d6bba58e6f23af7e862030a66cc0"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.5.0/devc-0.5.0-linux-aarch64"
      sha256 "0f8a87426303ea936f878713f6f98ce0228b5dacfee2371644a77d7ff0d7024b"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "devc-0.5.0-darwin-arm64" : "devc-0.5.0-darwin-x86_64"
    else
      Hardware::CPU.arm? ? "devc-0.5.0-linux-aarch64" : "devc-0.5.0-linux-x86_64"
    end
    bin.install binary => "devc"
  end

  test do
    system bin/"devc", "--help"
  end
end
