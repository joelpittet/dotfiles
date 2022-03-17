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
# Install a modern version of Bash.
# brew install bash
# brew install bash-completion2

# Switch to using brew-installed bash as default shell
#if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#  chsh -s "${BREW_PREFIX}/bin/bash";
#fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install screen
#brew install gmp

# SSH.
brew install openssh
brew install rsync
brew install ssh-copy-id

# Tools.
brew install gnu-sed
brew install patchutils
brew install ncdu

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
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
#brew install xz

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
brew install sublime-text
brew install obsidian
brew install iterm2

## DB clients.
# brew install dbeaver-community
# brew install sequel-pro

## Communication Casks.
# brew install microsoft-teams
# brew install zoom

# Install other useful binaries.
brew install dos2unix
brew install gs
brew install imagemagick
brew install openconnect
brew install pdfgrep
# brew install pv
brew install rbenv
brew install terminal-notifier
brew install webkit2png
brew install z

#brew install exiv2
# brew install git-lfs
# brew install lua
# brew install lynx
#brew install p7zip
#brew install pigz
#brew install rename
#brew install tree
#brew install vbindiff
#brew install zopfli

# Work.
#
# ansible
# colordiff
# dart-lang/dart/dart
# ghostscript
# gnupg
# httrack
# jq
# markdown
# maven
# mcrypt
# ruby-install
# sass/sass/sass
# sassc
# selenium-server-standalone
# wp-cli


# Original.
# ansible
# autoconf
# bash
# bash-completion
# bfg
# casperjs
# composer
# freetype
# gdbm
# gettext
# ghostscript
# graphicsmagick
# icu4c
# imagemagick
# jpeg
# libevent
# little-cms2
# makedepend
# mcrypt
# mhash
# nvm
# openssl
# pcre
# pkg-config
# readline
# slimerjs
# unixodbc
# xz

# Remove outdated versions from the cellar.
brew cleanup
