class Lazykeys < Formula
  desc "LazyKeys - Remap capslock to something useful"
  homepage "https://github.com/frostplexx/LazyKeys"
  url "https://github.com/frostplexx/LazyKeys/releases/download/v1.1.2/lazykeys.tar.gz"
  sha256 "cd02ff774834ab57b8cda59508ca0393645cdcd410025bb4618fddb043379cda"
  
  depends_on :macos

  def install
    bin.install "lazykeys" 
  end

  def caveats
    <<~EOS
      To use LazyKeys as a service:
        brew services start lazykeys
        
      To stop the service:
        brew services stop lazykeys
    EOS
  end

  service do
    run [opt_bin/"lazykeys"]
    keep_alive true
    log_path var/"log/lazykeys.log"
    error_log_path var/"log/lazykeys.log"
    # Ensure the service restarts after system reboots
    require_root true
  end

  test do
    system "#{bin}/lazykeys", "--version"
  end
end
