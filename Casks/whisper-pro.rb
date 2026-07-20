cask "whisper-pro" do
  version "2.0"
  sha256 "413cfa7fb44698011bacf216182f60af9d0d34e0d9d733edf6711abbe335ba86"

  url "https://github.com/ZdenekCulik/whisper-pro/releases/download/v#{version}/WhisperPro-#{version}.dmg",
      verified: "github.com/ZdenekCulik/whisper-pro/"
  name "Whisper Pro"
  desc "Native macOS voice-to-text app with a global hotkey"
  homepage "https://github.com/ZdenekCulik/whisper-pro"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Whisper Pro.app"

  uninstall quit: "com.prakashjoshipax.WhisperPro"

  zap trash: [
    "~/Library/Application Support/com.prakashjoshipax.WhisperPro",
    "~/Library/Caches/com.prakashjoshipax.WhisperPro",
    "~/Library/HTTPStorages/com.prakashjoshipax.WhisperPro",
    "~/Library/Preferences/com.prakashjoshipax.WhisperPro.plist",
  ]
end
