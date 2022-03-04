#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#brew install coreutils
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
brew install openssh
brew install screen
brew install php
#brew install gmp

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

# Install grepping packages.
brew install ack
brew install the_silver_searcher

# Install languages packages.
brew install node
brew install perl
brew install php
brew install python
brew install ruby

# Install database packages.
brew install mysql-client
brew install rlwrap
brew install sqlite

# Install Web Dev Packages.
brew install dnsmasq
brew install drud/ddev/ddev
brew install mkcert
brew install sass/sass/sass

# Install VCS.
brew install git
brew install subversion

# Install other useful binaries.
brew install dos2unix
brew install gnu-sed
brew install gs
brew install imagemagick
brew install ncdu
brew install openconnect
brew install patchutils
brew install pdfgrep
# brew install pv
brew install rbenv
brew install rsync
brew install ssh-copy-id
brew install terminal-notifier
brew install webkit2png
brew install z
brew install zsh-completions
brew install zsh-syntax-highlighting
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
# chruby
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
# subversion
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
# httpd24
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
# sassc
# slimerjs
# unixodbc
# xz

# Remove outdated versions from the cellar.
brew cleanup
