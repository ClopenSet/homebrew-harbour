class KarastatViewer < Formula
  desc "Keyboard heatmap viewer for KaraStat key logging data"
  homepage "https://github.com/ClopenSet/karastat-viewer"
  url "https://github.com/ClopenSet/karastat-viewer/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "de48e07b951720b767b36f7427a7b83d8ce7e5f4d6c6effbeb4406097cd78e6f"
  license "Unlicense"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags=-s -w", "-o", bin/"karastat-viewer", "."
  end

end
