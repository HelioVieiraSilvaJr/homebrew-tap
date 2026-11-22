#!/usr/bin/env bash
# Leva Casks/infinitypes.rb para a versão mais recente do InfiniTypes que tem o .dmg do Mac,
# inclusive as marcadas como pré-lançamento. Precisa do gh e do jq. Sem versão nova, não altera nada.
set -euo pipefail

repo="HelioVieiraSilvaJr/InfiniTypes"
cask="Casks/infinitypes.rb"

# A versão mais recente que tem o arquivo, e o arquivo.
release=$(gh api "repos/$repo/releases?per_page=30" --jq '
  [.[] | select(.draft | not) | . as $r
       | ($r.tag_name | ltrimstr("v")) as $v
       | $r.assets[] | select(.name == "InfiniTypes-macos-\($v).dmg")
       | {version: $v, asset: .}][0] // empty')
if [[ -z "$release" ]]; then
  echo "Nenhuma versão tem o .dmg do Mac"
  exit 0
fi
version=$(jq -r .version <<<"$release")

current=$(sed -nE 's/^  version "(.*)"$/\1/p' "$cask")
if [[ "$current" == "$version" ]]; then
  echo "A receita já está na $version"
  exit 0
fi

# O GitHub informa o SHA-256 de cada arquivo; sem ele, o arquivo é baixado.
sha=$(jq -r '.asset.digest // empty' <<<"$release")
if [[ "$sha" == sha256:* ]]; then
  sha=${sha#sha256:}
else
  sha=$(curl -fsSL "$(jq -r .asset.browser_download_url <<<"$release")" | shasum -a 256 | cut -d' ' -f1)
fi

sed -i.bak -E "s/^  version \".*\"$/  version \"$version\"/; s/^  sha256 \".*\"$/  sha256 \"$sha\"/" "$cask"
rm "$cask.bak"
echo "version=$version" >> "${GITHUB_OUTPUT:-/dev/null}"
echo "Receita atualizada: $current → $version"
