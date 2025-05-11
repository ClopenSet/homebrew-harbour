class Vecnorm < Formula
  include Language::Python::Shebang

  desc "CLI to compute vector norms using numpy"
  homepage "https://github.com/ClopenSet/vecnorm"
  url "https://github.com/ClopenSet/vecnorm/archive/v0.1.0.tar.gz"
  sha256 "3d3e9825c2215584b71eef2fa2c2dc08c448a53973b6414023ce903dbc3cd38e"  
  license "Unlicense"

  depends_on "python@3.13"
  depends_on "numpy"

  def install
    # 使用 Homebrew 的 Python 路径重写 shebang
    rewrite_shebang detected_python_shebang, "vecnorm.py"
    bin.install "vecnorm.py" => "vecnorm"
  end

  test do
    assert_match "5.0", shell_output("#{bin}/vecnorm 3 4").strip
  end
end
