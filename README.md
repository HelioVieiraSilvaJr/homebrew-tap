# Homebrew Tap do InfiniTypes

Receita do [Homebrew](https://brew.sh) para instalar e atualizar o [InfiniTypes](https://github.com/HelioVieiraSilvaJr/InfiniTypes) no Mac pelo terminal.

## Instalar

```bash
brew install --cask heliovieirasilvajr/tap/infinitypes
```

Requer macOS 26 num Mac com chip Apple.

O app ainda não é notarizado pela Apple, então o macOS bloqueia a primeira abertura de cada versão. Vá em **Ajustes → Privacidade e Segurança** e clique em **Abrir Mesmo Assim**. Na primeira vez, permita também o **Microfone** e a **Acessibilidade** e cole a sua chave da API da Anthropic nas Preferências.

## Atualizar

```bash
brew upgrade --cask infinitypes
```

O Homebrew fecha o InfiniTypes antes de trocar a versão. Depois, abra o app de novo.

## Desinstalar

```bash
brew uninstall --cask infinitypes          # remove o app
brew uninstall --cask --zap infinitypes    # remove também o histórico, o glossário, as preferências e o modelo de voz
```

A chave da API fica no Keychain e não é apagada. Para apagá-la, abra o **Acesso às Chaves** e procure `com.infinidim.InfiniTypes`.

## Como a receita se atualiza

O workflow [Atualizar o InfiniTypes](.github/workflows/update.yml) confere a cada 6 horas se saiu uma versão nova com o `.dmg` do Mac, inclusive as de pré-lançamento, e atualiza a versão e o hash em [`Casks/infinitypes.rb`](Casks/infinitypes.rb). Para atualizar na hora, rode o workflow na aba **Actions**.

O GitHub pausa os workflows agendados de repositórios sem atividade por 60 dias. Se isso acontecer, reative o workflow na aba **Actions**.
