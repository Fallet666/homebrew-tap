cask "vent" do
  version "1.2.1"
  sha256 "8ba16be38537a092866a6d34a2b24200bc26d90f6b943e5f9a4d1f0c3f79523e"

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
