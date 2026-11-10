class Ichibou < Formula
  desc "See what your coding agent is building, and know when it is really done"
  homepage "https://github.com/maromocooo/ichibou"
  url "https://github.com/maromocooo/ichibou/releases/download/v0.1.1/ichibou-0.1.1-darwin-arm64.tar.gz"
  sha256 "2a6bae8b6c657878cfeb68ef64f8ab0390d65c317243db40c897cb42f20bab55"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "ichibou"
    doc.install "README.md", "README.ja.md", "README.zh-CN.md"
  end

  def caveats
    <<~EOS
      Ichibou drives the Claude Code and Codex command-line tools you already
      have installed and signed in to. Check what it can find with:
        ichibou doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ichibou --version")
    # `doctor` lists the tools it looks for; it exits non-zero when no agent
    # CLI is installed, which is expected in the test environment.
    output = shell_output("#{bin}/ichibou doctor; true")
    assert_match "Node.js", output
  end
end
