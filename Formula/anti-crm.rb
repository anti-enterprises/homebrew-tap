class AntiCrm < Formula
  desc "The local-first CRM your AI agents can actually use"
  homepage "https://github.com/anti-enterprises/anti-crm"
  version "0.1.1"
  license "Apache-2.0"

  depends_on "oven-sh/bun/bun"

  on_macos do
    on_arm do
      url "https://github.com/anti-enterprises/anti-crm/releases/download/v0.1.1/anti-crm-v0.1.1-darwin-arm64.tar.gz"
      sha256 "943c80efe52b1c83e0414739523011cdad4e7a4ac8bf6f54a108d6668ae7b1b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/anti-enterprises/anti-crm/releases/download/v0.1.1/anti-crm-v0.1.1-linux-x64.tar.gz"
      sha256 "015d7ffcdd3ef985ba0e05c4aae4a2267ab2bd9c13cebef84de0cbfe34084b80"
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
