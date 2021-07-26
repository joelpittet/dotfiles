# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if type brew &>/dev/null; then
 FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

 autoload -Uz compinit
 compinit
fi

# autoload -Uz compinit && compinit
# zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
# fpath=(~/.zsh $fpath)

# Case insensitive file matching completion.
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Za-z}'


#eval "$(starship init zsh)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
for file in ~/.{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
#shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
#shopt -s histappend

# Autocorrect typos in path names when using `cd`
#setopt correctall


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# SSH Agent
ssh-add -A &> /dev/null

# Z
source /usr/local/etc/profile.d/z.sh

# CHRuby
source /usr/local/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Forward through reverse search
stty -ixon

# Disable zsh globbing (using wildcards in commands)
unsetopt nomatch

# Directory in iterm tab
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/pittet/.sdkman"
[[ -s "/Users/pittet/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/pittet/.sdkman/bin/sdkman-init.sh"
