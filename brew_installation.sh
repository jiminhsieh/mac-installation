#!/usr/bin/env bash

set -e

main() {
  local dev="${1:-yes}"
  local cli_tools=(jq q git gh tmux glances thefuck wget curl)
  local casks=(brave-origin 1password iina ghostty spotify chatgpt discord firefox keka)

  [[ "$dev" == yes || "$dev" == no ]] || {
    echo "Usage: $0 [yes|no]" >&2
    return 2
  }

  if [[ "$dev" == yes ]]; then
    cli_tools+=(sbt gradle maven scala python node vim wrk cloc grep container jq)
    casks+=(fork intellij-idea visual-studio-code sublime-text dbeaver-community zed)
  fi

  # CLI tools
  brew install "${cli_tools[@]}"

  # Desktop applications
  brew install --cask "${casks[@]}"
}

main "$@"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
