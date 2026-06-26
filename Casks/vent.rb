cask "vent" do
  version "1.3.4"
  sha256 "39e320a819b1f95a336fa4ea6a10008c59d066dd99b5e2c71574e4429e6bf5a9"

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
