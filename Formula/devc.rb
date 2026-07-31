class Devc < Formula
  desc "A simpler alternative to the Dev Containers CLI"
  homepage "https://github.com/rameshvarun/devc"
  version "0.6.0"

  on_macos do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.6.0/devc-0.6.0-darwin-x86_64"
      sha256 "2ae1a7abc60550a39ffda89bae893b10e0b8236ed7437275e5e380ad8da51ee0"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.6.0/devc-0.6.0-darwin-arm64"
      sha256 "8f2f9fe72784e4c4188e9f980a47fe7a0df61b05a4a831c2c05c352431a9f039"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.6.0/devc-0.6.0-linux-x86_64"
      sha256 "14a18dd4270b63bfc4eb4870c1385ae20d0155ef0b0235421513095171c8169a"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.6.0/devc-0.6.0-linux-aarch64"
      sha256 "b1d2d7c45922789b0ad2a1ea59a3239ad9a9a67489c4cd080463f1550656f145"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "devc-0.6.0-darwin-arm64" : "devc-0.6.0-darwin-x86_64"
    else
      Hardware::CPU.arm? ? "devc-0.6.0-linux-aarch64" : "devc-0.6.0-linux-x86_64"
    end
    bin.install binary => "devc"
  end

  test do
    system bin/"devc", "--help"
  end
end
