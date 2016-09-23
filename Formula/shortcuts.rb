class Shortcuts < Formula
  desc "CLI manager for your text replacements on macOS"
  homepage "https://github.com/rodionovd/shortcuts"
  head "https://github.com/rodionovd/shortcuts.git"

  depends_on :xcode => :build
  depends_on :macos => :el_capitan
  
  if MacOS.version <= :el_capitan
    url "https://github.com/rodionovd/shortcuts/archive/v1.1.1.tar.gz"
    sha256 "be38d1e0f21de25f2695853b75d5ec9d4686e3adcf0e41b9278c6d728b6d224e"
  else
    url "https://github.com/rodionovd/shortcuts/archive/v2.0.0.tar.gz"
    sha256 "630bc293831bb0dad94c677286746f7ee9a9c3933234c945e09a350f775add6f"
  end

  def install
    xcodebuild "-target", "shortcuts", "-configuration", "Release", "SYMROOT=symroot", "OBJROOT=objroot", "CODE_SIGN_IDENTITY="
    bin.install "symroot/Release/shortcuts"
  end

  test do
    system "#{bin}/shortcuts", "read"
  end
end
