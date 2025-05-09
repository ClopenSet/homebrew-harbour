class Greet < Formula
  desc "A greeting program that remembers what you tell it"
  homepage "https://github.com/ClopenSet/greet"
  url "https://github.com/ClopenSet/greet/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "db68e9650ec9d412364fa27e30578e7c62f9f215ee775955e5d8ce22d5d228e6"
  version "0.1.0"
  license "Unlicense"

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
  
  bottle do
    root_url "https://github.com/ClopenSet/greet/releases/download/v0.1.0"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "b92beb5d799a583c7bed233d074b846affd7c67719cc9aa745e348af4f018022"
  end

  test do
    system "#{bin}/greet", "change", "Hello, Test!"
    assert_equal "Hello, Test!", shell_output("#{bin}/greet").strip
  end
end
