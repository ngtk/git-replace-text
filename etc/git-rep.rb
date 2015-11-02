# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class GitRep < Formula
  desc ""
  homepage ""
  url "https://github.com/ngtk/git-rep/archive/v0.0.1.tar.gz"
  version "0.0.1"
  sha256 "86013a457836d37742a0b3cf67023139c6e23ae809a4664a0e28cc4dc414ee69"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "git", "init"
    path = testpath/"happy.rb"
    content = "unhappy"
    path.write content
    system "git", "add", "."
    system "git", "commit", "-m", "unhappy..."

    system bin/"git-replace-text", "unhappy", "happy"
  end
end
