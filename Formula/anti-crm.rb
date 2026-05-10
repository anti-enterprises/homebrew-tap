class AntiCrm < Formula
  desc "The local-first CRM your AI agents can actually use"
  homepage "https://github.com/anti-enterprises/anti-crm"
  version "0.1.0"
  license "Apache-2.0"

  depends_on "bun"

  on_macos do
    on_arm do
      url "https://github.com/anti-enterprises/anti-crm/releases/download/v0.1.0/anti-crm-v0.1.0-darwin-arm64.tar.gz"
      sha256 "9b7c8be1d6bec529ee72411070ef672c2cb4546bbdc3359d6b2da22f1203d954"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/crm" => "crm"
  end

  test do
    assert_match "anti-crm v#{version}", shell_output("#{bin}/crm --version")
    assert_match "Anti-CRM", shell_output("#{bin}/crm --help")
  end
end
