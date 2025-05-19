class Opsops < Formula
  desc "A wrapper for sops that integrates 1Password"
  homepage "https://github.com/frostplexx/opsops"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/frostplexx/opsops/releases/download/v#{version}/opsops-macos-aarch64"
      sha256 "956eb02f8f8465674902432a5709581658c3796dce3f6c34317e3a50fe124e4b"
    elsif Hardware::CPU.intel?
      url "https://github.com/frostplexx/opsops/releases/download/v#{version}/opsops-macos-x86_64"
      sha256 "a74ccb11e1570e000a6ce3ffcfde975e881077a12a2d298e4f48cce17b049050"
    end
  end

  depends_on :macos

  def install
    bin.install Dir["opsops-*"].first => "opsops"
  end

  def caveats
    <<~EOS
      To use opsops as a service:
        brew services start opsops
        
      To stop the service:
        brew services stop opsops
    EOS
  end

  test do
    system "#{bin}/opsops", "--version"
  end
end
