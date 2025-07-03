class KarastatViewer < Formula
  desc "Keyboard heatmap viewer for KaraStat key logging data"
  homepage "https://github.com/ClopenSet/karastat-viewer"
  url "https://github.com/ClopenSet/karastat-viewer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "eb33784b75c44374d4c96ea2d4474dac28f68ec124a4ceb939c362f4a5ba7f61"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags=-s -w", "-o", bin/"karastat-viewer", "."
  end

end
