class Devc < Formula
  desc "A simpler alternative to the Dev Containers CLI"
  homepage "https://github.com/rameshvarun/devc"
  version "0.7.0"

  on_macos do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.7.0/devc-0.7.0-darwin-x86_64"
      sha256 "0a61689cc7af439243f7d4ec04d9e5a45a74c9b74e159172d720ec62377b9d50"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.7.0/devc-0.7.0-darwin-arm64"
      sha256 "57f2ac0a02a3fcf19f4e58c729477123bc717f08bea8177831d1a70f08040220"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/rameshvarun/devc/releases/download/v0.7.0/devc-0.7.0-linux-x86_64"
      sha256 "25ce1924aa26110e5b3139aac441ad4d8f7914b696b642f81c1d5ccd5783651b"
    end
    on_arm do
      url "https://github.com/rameshvarun/devc/releases/download/v0.7.0/devc-0.7.0-linux-aarch64"
      sha256 "68e4d90f0142cf61d48747b9d478233dcdff596a57f20084ff97028a8f230d84"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "devc-0.7.0-darwin-arm64" : "devc-0.7.0-darwin-x86_64"
    else
      Hardware::CPU.arm? ? "devc-0.7.0-linux-aarch64" : "devc-0.7.0-linux-x86_64"
    end
    bin.install binary => "devc"
  end

  test do
    system bin/"devc", "--help"
  end
end
