cask "vent" do
  version "1.2.15"
  sha256 "1406dd2a2c9d30a5a6528e9ebb489534ff667d071735d5b6394c183516d13972"

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
