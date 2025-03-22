alias gs="git status"
alias gfo="git fetch origin"
alias gpal="git pull --all"
alias gP="git push"
alias gp="git pull"
alias cls="clear"

alias hasura-apply="hasura metadata apply --admin-secret hasuraadmin"
alias hasura-export="hasura metadata export --admin-secret hasuraadmin"
alias hasura-reload="hasura metadata reload --admin-secret hasuraadmin"

alias gs="git status"
alias aoike-check="npm run build; npm run find-deadcode:error"
alias gll='git log --pretty="%C(auto)%h %C(auto)%d%Creset%n %C(cyan)%an %C(dim white)%ad%n %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M" --graph'

alias gll='git log --pretty="%C(auto)%h %C(auto)%d%Creset%n %C(cyan)%an %C(dim white)%ad%n %s%Creset%n" --date=format:"%a %Y-%m-%d %H:%M" --graph'


alias gb="git branch --sort=-committerdate --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:cyan)%(authorname)%(color:reset) %(color:dim white)(%(committerdate:relative))%(color:reset)'"

alias create-component="node ~/HapinsWork/Developer/ultimate-file-folder-generator/createComponent.js"
alias cfsd="node ~/HapinsWork/Developer/ultimate-file-folder-generator/createFsdPagesComponents.js"
alias lgit="lazygit"
alias lsql="lazysql"
alias ldocker="lazydocker"
alias gstal="git stash list"
alias posting-start="source .venv/bin/activate; posting" 

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function gstaf() {
  stash_name=$(git stash list | fzf --reverse | sed -E 's/:.*//' | xargs)
  
  if [[ -n "$stash_name" ]]; then
    git stash pop "$stash_name"
  else
    echo "No stash selected."
  fi
}

function gco () {
    if [[ $# -eq 0 ]]; then
        gb | fzf --reverse | xargs | cut -d ' ' -f 1 | xargs git checkout
    else
        git checkout "$@"
    fi
}

function gcoa {
    gb --all | fzf --reverse | xargs | cut -d ' ' -f 1 | sed 's/^origin\///' | xargs git checkout
}


function gco () {
    if [[ $# -eq 0 ]]; then
        gb | fzf --reverse | xargs | cut -d ' ' -f 1 | xargs git checkout
    else
        git checkout "$@"
    fi
}

function gcoa {
    gb --all | fzf --reverse | xargs | cut -d ' ' -f 1 | sed 's/^origin\///' | xargs git checkout
}



function gwt() {
  if [ -z "$1" ]; then
    echo "Usage: gwt <option> (options: hot-fix, review, bug)"
    return 1
  fi

  local option="$1"
  local project_name

  # Auto-detect the project name from the Git repository
  project_name=$(basename "$(git rev-parse --show-toplevel)" 2>/dev/null)

  if [ -z "$project_name" ]; then
    echo "Error: Not inside a Git repository."
    return 1
  fi

  # Validate the provided option
  case "$option" in
    hot-fix|review|bug)
      ;;
    *)
      echo "Invalid option. Use one of: hot-fix, review, bug"
      return 1
      ;;
  esac

  # Ensure main branch exists, otherwise, try 'master'
  local base_branch="main"
  if ! git show-ref --verify --quiet refs/heads/main; then
    base_branch="master"
  fi

  # Define the worktree path
  local worktree_path="../${project_name}-${option}"
  echo "Adding worktree: $worktree_path from branch $base_branch as new branch '$option'"

  # Create the worktree with a new branch
  git worktree add -b "$option" "$worktree_path" "$base_branch"
}

echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc


# cd -> zoxide
export _ZO_RESOLVE_SYMLINKS=1
eval "$(zoxide init zsh --cmd cd)"

# open apps 
alias openapps='open -a "Google Chrome" --args --profile-directory="Profile 1"; sleep 2; \
open -a "Cursor"; sleep 2; \
open -a "Slack"; sleep 2; \
open -a "Brave Browser" --args --profile-directory="Profile 1"; sleep 2; \
open -a "Docker"'

eval "$(starship init zsh)"
#Activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh


export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"



eval "$(zoxide init zsh)"