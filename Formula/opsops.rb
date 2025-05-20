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

    # Generate and install docs
    doc_dir = buildpath/"doc_output"
    mkdir_p doc_dir
    system bin/"opsops", "generate-docs", "--dir", doc_dir
    
    # Install man pages
    man1.install doc_dir/"man/opsops.1"
    
    # Install fish completions
    fish_completion.install doc_dir/"completions/opsops.fish"
    end
  end

  test do
    system "#{bin}/opsops", "--version"
  end
end
