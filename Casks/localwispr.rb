cask "localwispr" do
  version "1.0.0"
  sha256 "6c5a1d11fc6d7264f0ffeaf9056ae0b2df03e7759d8181ba44c4a5622aba065b"

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
