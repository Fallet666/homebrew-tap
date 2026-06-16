cask "fan-control" do
  version "1.1.7"
  sha256 "a7556948bf20043b4aa27c5f23340ff257fe4d83c7f0306322472a5ab0f8045c"

  url "https://github.com/Fallet666/mac-manual-rpm/releases/download/v#{version}/FanControl-#{version}.dmg"
  name "FanControl"
  desc "macOS fan speed controller with Apple Silicon support"
  homepage "https://github.com/Fallet666/mac-manual-rpm"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "FanControl.app"

  uninstall quit: "com.fancontrol.gui"

  zap trash: [
    "~/Library/Preferences/com.fancontrol.gui.plist",
  ]

  caveats <<~EOS
    The privileged helper is required for fan control. Install it by running:

        sudo /Applications/FanControl.app/Contents/Resources/fanctl install

    To uninstall the helper later:

        sudo /Applications/FanControl.app/Contents/Resources/fanctl uninstall
  EOS
end
