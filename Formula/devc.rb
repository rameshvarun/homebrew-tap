class Devc < Formula
  desc "Simpler alternative to the Dev Containers CLI"
  homepage "https://github.com/rameshvarun/devc"
  version "0.4.0"

  on_macos do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.4.0/devc-0.4.0-darwin-x86_64"
      sha256 "8334ed80c7c164551305d3d657d7b6a53c44ef313e993e3edac0b7317b2ea6eb"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.4.0/devc-0.4.0-darwin-arm64"
      sha256 "00cda53bd586861550690b79f62546c3d67c2294482e908b82b35581af28c79c"
    end
  end

  def install
    binary = Hardware::CPU.arm? ? "devc-0.4.0-darwin-arm64" : "devc-0.4.0-darwin-x86_64"
    bin.install binary => "devc"
  end

  test do
    system bin/"devc", "--help"
  end
end
