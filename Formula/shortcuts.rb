class Shortcuts < Formula
  desc "CLI manager for your text replacements on macOS"
  homepage "https://github.com/rodionovd/shortcuts"
  url "https://github.com/rodionovd/shortcuts/archive/v1.1.0.tar.gz"
  sha256 "aa74d875256b4fe440b96a8b4c13a4615f7085257b2da1e8c2f1cbfd912334cc"

  head "https://github.com/rodionovd/shortcuts.git"

  depends_on :xcode => :build
  depends_on :macos => :el_capitan

  def install
    xcodebuild "-target", "shortcuts", "-configuration", "Release", "SYMROOT=symroot", "OBJROOT=objroot", "CODE_SIGN_IDENTITY="
    bin.install "symroot/Release/shortcuts"
  end

  test do
    system "#{bin}/shortcuts", "read"
  end
end
