cask "whisper-pro" do
  version "2.2.4"
  sha256 "47507555f005d8a8c5d968ddb4945eb630aeb7d7a8d791f0f842b5606b71ea60"

  url "https://github.com/ZdenekCulik/whisper-pro/releases/download/v#{version}/WhisperPro-#{version}.dmg",
      verified: "github.com/ZdenekCulik/whisper-pro/"
  name "Whisper Pro"
  desc "Voice-to-text dictation app with a global hotkey"
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
