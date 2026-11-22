cask "infinitypes" do
  version "0.1.0"
  sha256 "044312992ab5fc284951d9a1cfa7f65fb9b78a0557b3e1a4f0117df6b34e70b1"

  url "https://github.com/HelioVieiraSilvaJr/InfiniTypes/releases/download/v#{version}/InfiniTypes-macos-#{version}.dmg"
  name "InfiniTypes"
  desc "Ditado que transforma a fala em prompts para IAs de codificação"
  homepage "https://github.com/HelioVieiraSilvaJr/InfiniTypes"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "InfiniTypes.app"

  uninstall quit: "com.infinidim.InfiniTypes"

  zap trash: [
    "~/Library/Application Support/InfiniTypes",
    "~/Library/Caches/com.infinidim.InfiniTypes",
    "~/Library/HTTPStorages/com.infinidim.InfiniTypes",
    "~/Library/Preferences/com.infinidim.InfiniTypes.plist",
  ]
end
