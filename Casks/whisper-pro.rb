cask "whisper-pro" do
  version "2.2"
  sha256 "3230842a2499cc9faac7dc49c055bcd85119f13b51286a2e593fc6f85a4e17d9"

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

  # 2.1 is Developer ID signed but not notarized: Apple's notary service was
  # holding submissions when it shipped. Drop this once a notarized build lands.
  caveats <<~EOS
    If macOS refuses to open Whisper Pro, allow it once in
    System Settings > Privacy & Security > "Open Anyway".
  EOS
end
