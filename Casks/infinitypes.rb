cask "infinitypes" do
  version "0.1.1"
  sha256 "e9adf9dd6eb75079eab4d2c9b9b531e9b3a3eb3643c79d285ad87d82cec4c5c8"

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
