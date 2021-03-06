source ~/.dotfiles/zsh/antigen.zsh

export PATH="$HOME/Tools/bin:$HOME/.dotfiles/bin:$HOME/.cargo/bin/:$PATH"
export EDITOR="vim"

# Enable Emacs to track the current directory
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

# Keep Ctrl+S from hosing the shell (would need Ctrl+Q to fix)
stty -ixon

# Make sure directory colors are inherited from the theme
eval "$(dircolors -b)"

# Edit files in Emacs
edit () { emacsclient -n $* }

antigen use oh-my-zsh

antigen bundle git
antigen bundle npm
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle lukechilds/zsh-nvm

# Config options: https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
export SPACESHIP_TIME_SHOW="true"
export SPACESHIP_TIME_COLOR="060"
export SPACESHIP_TIME_12HR="true"
export SPACESHIP_TIME_PREFIX="• "
export SPACESHIP_EXEC_TIME_PREFIX="• took "
export SPACESHIP_PROMPT_DEFAULT_PREFIX="• "
export SPACESHIP_GIT_PREFIX="• "
export SPACESHIP_PACKAGE_SYMBOL=""
export SPACESHIP_PACKAGE_PREFIX="@ "
export SPACESHIP_PACKAGE_COLOR="214"
export SPACESHIP_HOST_SHOW="always"
export SPACESHIP_DIR_PREFIX=" "
export SPACESHIP_HOST_PREFIX=""
export SPACESHIP_HOST_SUFFIX=" ॐ"
export SPACESHIP_RUBY_SYMBOL=""
export SPACESHIP_CHAR_SYMBOL="λ "
export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  golang        # Go section
  rust          # Rust section
  haskell       # Haskell Stack section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  time          # Time stamps section
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

antigen theme denysdovhan/spaceship-prompt

# Other themes:
# antigen theme norm
# dogenpunk ॐ

antigen apply

# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
