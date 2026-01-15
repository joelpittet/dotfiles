# joelpittet's dotfiles

A collection of macOS dotfiles based on [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles) with personal customizations and improvements.

## Features

- **Shell**: Uses `zsh` with custom configurations
- **Package Management**: Uses `stow` to manage symlinks to the git repository
- **Homebrew Integration**: Automated installation of useful formulae
- **Git Aliases**: Comprehensive set of git and drush aliases for improved workflow
- **macOS Defaults**: Sensible macOS system preferences and settings

## What's Included

### Command Line Tools
- [z](https://github.com/rupa/z) - Fuzzy directory navigation
- Custom aliases for git, drush, and common commands
- Enhanced shell functions and utilities

### Configuration Files
- Shell configuration (`.zshrc`, `.exports`, `.functions`)
- Git configuration (`.gitconfig`, `.gitignore`)
- Editor configuration (`.editorconfig`)
- macOS system preferences (`.macos`)

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk!

### Prerequisites

- macOS with Xcode Command Line Tools installed:
  ```bash
  xcode-select --install
  ```
- [Homebrew](https://brew.sh/) installed (required for `brew bundle` and most tooling)
- GNU Stow installed (included in the Brewfile)

### Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/joelpittet/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. Install Homebrew formulae:
   ```bash
   brew bundle --file Brewfile
   ```

3. Create symlinks using stow (from inside the repo):
   ```bash
   stow --target="$HOME" .
   ```

   **Notes:**
   - If you have existing dotfiles, back them up first (or use `stow --adopt .` to adopt existing files into the repo).
   - `stow` will link most files in this repo into `$HOME`; exclusions are defined in `.stow-local-ignore`.
   - Prefer stowing specific areas if you want a smaller footprint (example: `stow --target="$HOME" zsh`).

### Alternative Installation Methods

#### Git-free Install
To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/joelpittet/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,.macos,LICENSE.txt}
```

**Caution:** This extracts directly into your home directory and may overwrite existing files. Back up any existing dotfiles first and consider inspecting the archive contents (`tar -tz ...`) before extracting.

To update later, run the same command again.

#### Updating
To update your dotfiles, navigate to your local repository and pull the latest changes:

```bash
cd ~/dotfiles
git pull
```

### Homebrew (Brewfile)
Install the packages in the Brewfile:

```bash
brew bundle --file Brewfile
```

## Configuration

### Custom PATH
If `~/.path` exists, it will be sourced along with other files before any feature testing takes place.

Example `~/.path` file:
```bash
export PATH="/usr/local/bin:$PATH"
```

### Git Credentials
Set up your Git credentials by creating a `~/.gitconfig.local` file or running:

```bash
# Set your Git credentials
GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="your.email@example.org"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Additional Customizations
You can use `~/.extra` to override settings, functions, and aliases from this dotfiles repository. However, it's recommended to [fork this repository](https://github.com/joelpittet/dotfiles/fork) for better version control.

## macOS Setup

### System Preferences
When setting up a new Mac, you may want to apply sensible macOS defaults:

```bash
./.macos
```

**Caution:** `./.macos` changes system settings. Read through the script and remove anything you don't want before running it.

### Homebrew Formulae
Install common [Homebrew](https://brew.sh/) formulae:

```bash
brew bundle --file Brewfile
```

**Important:** Some functionality in these dotfiles depends on formulae installed by the Brewfile. If you don't plan to run it, manually install the essential packages, especially those required for Bash/Git completion.

## Feedback

[Ping me on Twitter](http://twitter.com/joelpittet) or open an issue on GitHub.

## Thanks

* [Mathias Bynens](http://mathiasbynens.be/) for providing an [excellent foundation](https://github.com/mathiasbynens/dotfiles)
* The open-source community for continuous improvements and inspiration
