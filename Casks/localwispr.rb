cask "localwispr" do
  version "1.0.0"
  sha256 :no_check # Updated with actual checksum on each release

  url "https://github.com/srikruthreddy7/LocalWispr/releases/download/v#{version}/LocalWispr.dmg"
  name "LocalWispr"
  desc "Local voice dictation for macOS — transcribe speech on-device and insert at cursor"
  homepage "https://github.com/srikruthreddy7/LocalWispr"

  depends_on macos: ">= :sequoia"

  app "LocalWisprHost.app"

  zap trash: [
    "~/Library/Preferences/com.localwispr.host.plist",
    "~/Library/Application Support/LocalWispr",
  ]
end
