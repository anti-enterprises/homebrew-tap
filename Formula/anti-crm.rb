class AntiCrm < Formula
  desc "The local-first CRM your AI agents can actually use"
  homepage "https://github.com/anti-enterprises/anti-crm"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/anti-enterprises/anti-crm/releases/download/v0.1.1/anti-crm-v0.1.1-darwin-arm64.tar.gz"
      sha256 "943c80efe52b1c83e0414739523011cdad4e7a4ac8bf6f54a108d6668ae7b1b4"
      resource "bun" do
        url "https://github.com/oven-sh/bun/releases/download/bun-v1.2.17/bun-darwin-aarch64.zip"
        sha256 "9f55fd213f2f768d02eb5b9885aaa44b1e1307a680c18622b57095302a931af9"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/anti-enterprises/anti-crm/releases/download/v0.1.1/anti-crm-v0.1.1-linux-x64.tar.gz"
      sha256 "015d7ffcdd3ef985ba0e05c4aae4a2267ab2bd9c13cebef84de0cbfe34084b80"
      if Hardware::CPU.avx2?
        resource "bun" do
          url "https://github.com/oven-sh/bun/releases/download/bun-v1.2.17/bun-linux-x64.zip"
          sha256 "6054207074653b4dbc2320d5a61e664e4b6f42379efc18d6181bffcc07a43193"
        end
      else
        resource "bun" do
          url "https://github.com/oven-sh/bun/releases/download/bun-v1.2.17/bun-linux-x64-baseline.zip"
          sha256 "6ea1861db6a6cd44d1c8b4bafb22006f4ae49f6a2d077623bf3f456ada026d67"
        end
      end
    end
  end

  def install
    libexec.install Dir["*"]
    resource("bun").stage do
      libexec.install "bun"
    end

    (bin/"crm").write <<~SH
      #!/bin/bash
      export PATH="#{libexec}:$PATH"
      exec "#{libexec}/bin/crm" "$@"
    SH
    chmod 0755, bin/"crm"
  end

  test do
    assert_match "anti-crm v#{version}", shell_output("#{bin}/crm --version")
    assert_match "Anti-CRM", shell_output("#{bin}/crm --help")
  end
end
