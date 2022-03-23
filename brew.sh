#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Used to symlink the dot files.
brew install stow

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install screen
#brew install gmp

# Fonts
brew tap homebrew/cask-fonts
brew install font-office-code-pro

# SSH.
brew install openssh
brew install rsync
brew install ssh-copy-id

# Tools.
brew install gnu-sed
brew install patchutils
brew install ncdu

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf

# Grepping packages.
brew install ack
brew install the_silver_searcher

# Install languages packages.
brew install node
brew install perl
brew install php
brew install python
brew install ruby

# Lanaguage Package managers.
brew install chruby
brew install rbenv

# Install database packages.
brew install mysql-client
brew install rlwrap
brew install sqlite

# Install Web Dev Packages.
brew install dnsmasq
brew install drud/ddev/ddev
brew install mkcert
brew install sass/sass/sass

# VCS.
brew install git
brew install subversion

# Shell.
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install romkatv/powerlevel10k/powerlevel10k

# Casks.
brew install --cask sublime-text
brew install --cask obsidian
brew install --cask iterm2
# brew install --cask utm
# brew install --cask rectangle
# brew install --cask maven
# brew install --cask kaleidoscope
# brew install --cask soulver

## DB clients.
# brew install --cask dbeaver-community
# brew install --cask sequel-pro

## Communication Casks.
# brew install --cask microsoft-teams
# brew install --cask zoom
# brew install --cask slack
# brew install --cask discord

## Security casks.
# brew install --cask little-snitch
# brew install --cask micro-snitch

# Install other useful binaries.
brew install dos2unix
brew install gs
brew install openconnect
brew install pdfgrep
brew install readline
# brew install pv
brew install terminal-notifier
brew install webkit2png
brew install z

# brew install lua
#brew install tree


# Work.
brew install bfg


# ansible
# colordiff
# dart-lang/dart/dart
# gnupg
# httrack
# jq
# markdown
# mcrypt
# ruby-install
# selenium-server-standalone
# wp-cli


# Original.

# ansible
# nvm
# openssl
# pcre

# Remove outdated versions from the cellar.
brew cleanup

# compaudit will complain about insecure permissions, lock them down.
chmod g-w $(brew --prefix)/share

# Setup vim backup folder.
[ -d $HOME/.vim/backups ] || mkdir $HOME/.vim/backups
[ -d $HOME/.vim/swaps ] || mkdir $HOME/.vim/swaps
[ -d $HOME/.vim/undo ] || mkdir $HOME/.vim/undo
