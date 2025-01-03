class Greet < Formula
  desc "A greeting program that remembers what you tell it"
  homepage "https://github.com/ClopenSet/greet"
  url "https://github.com/ClopenSet/greet/archive/refs/tags/v1.0.tar.gz"
  sha256 "c05bf4d9f1b6d76c91fd2847829b9a55e59eb5fb15705a87ca307484ed75f738"
  version "1.0"

  depends_on "boost"

  def install
    # 编译程序
    system "g++", "-std=c++11", "src/greet.cpp", "-o", "greet", "-lboost_system", "-lboost_filesystem"

    # 将编译后的可执行文件安装到 libexec
    libexec.install "greet"

    # 安装资源文件
    (libexec/"resources").install "resourses/greet.txt"

    # 创建包装脚本，确保环境变量和路径正确
    (bin/"greet").write_env_script libexec/"greet", GREET_STORAGE: "#{libexec}/resources"
  end

  test do
    system "#{bin}/greet", "change", "Hello, Test!"
    assert_equal "Hello, Test!", shell_output("#{bin}/greet").strip
  end
end
