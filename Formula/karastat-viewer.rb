class KarastatViewer < Formula
  desc "Keyboard heatmap viewer for KaraStat key logging data"
  homepage "https://github.com/ClopenSet/karastat-viewer"
  url "https://github.com/ClopenSet/karastat-viewer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "256b743bf98fff7a0d1a7eaff8cd3618f3fe50b8e674c94b2973f8ce6113376d"
  license "Unlicense"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags=-s -w", "-o", bin/"karastat-viewer", "."
  end

end
