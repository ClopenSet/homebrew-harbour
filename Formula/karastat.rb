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
    red = "\033[31m"
    bold = "\033[1m"
    reset = "\033[0m"
    <<~EOS
      KaraStat is a background keypress tracking tool based on Karabiner-Elements. It simulates the behavior of WhatPulse on MacOS.
      -- 
      We are tired of providing a bottle every year to follow the pace of MacOS system and therefore you have to build the software yourself.
      However, this software follows Karabiner-Elements automatically so it will follow the latest system and build smoothly.
      If you are a non-developer, you have to:
      * Download an Xcode app and do nothing.
      * xcode-select --install
      * sudo xcodebuild -license accept
      * sudo xcodebuild -runFirstLaunch
      * Then brew install this software
      --
      Since keylogging is a relative sensitive permission on MacOS, please read the instruction below CAREFULLY.

      ******************************
      If it is not installed at the first time (e.g. upgrading or reinstalling after uninstallation).
      Be sure to #{bold}#{red}CANCEL and DELETE#{reset} the previous permission [Using the (-) button] for the previous version of the keylogger at: 
        System Settings > Privacy & Security > Input Monitoring
      
      * This is due to an inherent of FEATURE of MacOS permission management system to silently fail due to permission.
      * You must cancel in advance the permission of the old software of the same name to acquire the new permission.

      ******************************

      After installation, run:
        brew services start karastat

      On first launch, macOS will prompt you for "Input Monitoring" permission.
      Approve it at:
        System Settings > Privacy & Security > Input Monitoring
      
      ******************************
      After granting access, #{bold}#{red}RESTART#{reset} the service:

        brew services restart karastat

      * Or else the permission won't work.
      ******************************

      All usage data is stored in:
        ~/Library/Application Support/KaraStat/

      You can view statistics using:

        karastat-viewer
    EOS
  end
end
