{{ if eq .osid "linux-debian" "linux-ubuntu" -}}

{{ $packages := list
     "curl"
     "direnv"
     "git-lfs"
     "jq"
     "golang"
     "docker"
     "nodejs"
     "npm"
     "docker-compose"
     "libssl-dev"
     "ripgrep"
     "units"
     "vim"
     "fzf"
     "zsh" -}}
{{ $classicSnaps := list -}}

{{ if .isovalent -}}
{{   $packages = concat $packages (list
       "build-essential"
       "clang"
       "libelf-dev"
       "llvm"
       "protobuf-compiler"
       "python3-pip"
       "vagrant"
       "virtualbox") -}}
{{   $classicSnaps = concat $classicSnaps (list
       "google-cloud-sdk") -}}
{{ end -}}

{{ if not .headless -}}
{{   $packages = mustAppend $packages "vim-gtk" -}}
{{   $classicSnaps = mustAppend $classicSnaps "code" -}}
{{ end -}}

{{ if .personal -}}
{{   $classicSnaps = mustAppend $classicSnaps "goreleaser" -}}
{{ end -}}

{{ $sudo := "sudo " -}}
{{ if eq .chezmoi.username "root" -}}
{{   $sudo = "" -}}
{{ end -}}

#!/bin/bash

set -eufo pipefail

{{ $sudo }}apt-get update
{{ $sudo }}apt-get install -y {{ $packages | join " " }}

## Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install v16.4.2
nvm alias default v16.4.2

## Install antibody
{{ if eq .chezmoi.os "darwin" }}
brew install antibody
{{ else if eq .chezmoi.os "linux" }}
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
{{- end }}

## Installing rust
{{ if eq .chezmoi.os "darwin"}}
 ## Install rust
{{ else if eq .chezmoi.os "linux" }}
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
{{- end }}

if [[ ! -d "$HOME/.oh-my-zsh/themes/spaceship-prompt" ]]; then
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.oh-my-zsh/themes/spaceship-prompt" --depth=1
fi

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Install yarn
npm i -g corepack

source $HOME/.cargo/env

{{ range $classicSnaps }}
{{ $sudo }}snap install --classic {{ . }}
{{ end }}

## Install cargo-edit
cargo install cargo-edit

{{ if eq .chezmoi.os "darwin"}}
 ## Install just
 brew install just
{{ else if eq .chezmoi.os "linux" }}
  cargo install just
{{- end }}

{{ end }}
