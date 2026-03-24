cask "localwispr" do
  version "1.0.0"
  sha256 "c88795067b83d45c8fc399e12ee818e731d80aa0ddf6297b71020f191cc3118d"

  url "https://github.com/srikruthreddy7/LocalWispr/releases/download/v#{version}/LocalWispr.dmg"
  name "LocalWispr"
  desc "Local voice dictation for macOS — transcribe speech on-device and insert at cursor"
  homepage "https://github.com/srikruthreddy7/LocalWispr"

  depends_on macos: ">= :sequoia"

  app "LocalWisprHost.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/LocalWisprHost.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.localwispr.host.plist",
    "~/Library/Application Support/LocalWispr",
  ]
end
