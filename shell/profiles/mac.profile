up() {
  brew upgrade
  brew cask upgrade --greedy

  # "brew upgrade" internally runs "brew cleanup" if "brew cleanup" has not been run in 30 days, but it is advisable to run "brew cleanup" as often as possible.
  # "brew cleanup" also delete cask caches.
  brew cleanup

  # Reinstall node because "sudo npm install -g npm" in the next step fails without reinstalling node.
  # sudo rm -rf /usr/local/lib/node_modules/npm
  # brew reinstall node

  # Upgrade npm in case node installed from Homebrew does not contain the latest npm.
  sudo npm install npm@latest -g
}
