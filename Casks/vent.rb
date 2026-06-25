cask "vent" do
  version "1.3.0"
  sha256 "75fe4f759f87fb1810e0d6a18fedabba11dd4c678abf6f8db2cf67784fb35398"

  url "https://github.com/Fallet666/vent/releases/download/v#{version}/Vent-#{version}.dmg"
  name "Vent"
  desc "macOS fan speed controller with Apple Silicon support"
  homepage "https://github.com/Fallet666/vent"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Vent.app"

  uninstall quit: "dev.borninvoid.macfancontrol"

  zap trash: [
    "~/Library/Preferences/dev.borninvoid.macfancontrol.plist",
    "~/Library/Saved Application State/dev.borninvoid.macfancontrol.savedState",
  ]

  caveats <<~EOS
    Vent requires a privileged helper daemon for fan control.

    Install it by launching the app and clicking "Install / Update"
    in the menu-bar popover settings.

    Or install manually:

        sudo /Applications/Vent.app/Contents/Resources/ventd --install
  EOS
end
