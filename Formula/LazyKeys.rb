class Lazykeys < Formula
  desc "LazyKeys - Remap capslock to something useful"
  homepage "https://github.com/frostplexx/LazyKeys"
  url "https://github.com/frostplexx/LazyKeys/releases/download/v1.1.1/lazykeys.tar.gz"
  sha256 "fa57c1eda1941f12ed95e31ef90f4c6681a463ab103ec9ea548cf0afa583982e"
  
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
