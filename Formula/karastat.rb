class Karastat < Formula
  desc "A tool that tracks and stores how many times each key is pressed"
  homepage "https://github.com/ClopenSet/KaraStat"
  url "https://github.com/ClopenSet/KaraStat.git", tag: "v1.0.1"
  head "https://github.com/ClopenSet/KaraStat.git", branch: "main"

  depends_on "xcodegen" => :build
  depends_on :macos

  bottle do
    root_url "https://github.com/ClopenSet/KaraStat/releases/download/v1.0.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e3aab6e811c4d8138edaede364897108ca03699b09d815ba2e64a4953944cdcf"
  end
  
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
      To begin using KaraStat, you must first run:

        brew services start karastat

      The first time you launch the service, macOS will prompt you to grant "Input Monitoring" access.
      Please approve this request in System Settings > Privacy & Security > Input Monitoring.

      After granting access, you must restart the service:

        brew services restart karastat

      Once enabled, KaraStat will accurately track your physical keyboard keypresses.
      All data is stored in a SQLite file located under:

        ~/Library/Application Support/karastat/
    EOS
  end
end
