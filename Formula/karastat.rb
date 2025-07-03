class Karastat < Formula
  desc "A tool that tracks and stores how many times each key is pressed"
  homepage "https://github.com/ClopenSet/KaraStat"
  url "https://github.com/ClopenSet/KaraStat.git", tag: "v1.0.2"
  head "https://github.com/ClopenSet/KaraStat.git", branch: "main"

  depends_on "karastat-viewer"
  depends_on "xcodegen" => :build
  depends_on :macos

  def install
    ENV.deparallelize
    system "make"
    bin.install "karastat"
  end

  service do
    run [opt_bin/"karastat"]
    keep_alive true
    run_type :immediate
    log_path var/"log/karastat.log"
    error_log_path var/"log/karastat.log"
  end

  def caveats
    <<~EOS
      KaraStat is a background keypress tracking tool.

      After installation, run:

        brew services start karastat

      On first launch, macOS will prompt you for "Input Monitoring" permission.
      Approve it at:
        System Settings > Privacy & Security > Input Monitoring

      After granting access, restart the service:

        brew services restart karastat

      All usage data is stored in:
        ~/Library/Application Support/karastat/

      You can view statistics using:

        karastat-viewer
    EOS
  end
end
