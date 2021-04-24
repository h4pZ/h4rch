# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/h4pz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export LANG=en_US.utf8
export LC_ALL=en_US.utf8
plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
# ALIAS SECTION #
alias cp='cp -i'                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
#alias sxiv='sxiv -b -a'
alias lsa="exa -lah"
alias ls="exa -lh"
alias cat="bat"
alias astmx="tmux a -t stats"
alias amtmx="tmux a -t main"
alias tkill="tmux kill-server"
alias nvt='nvtop nvtop'
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'
alias icat="kitty +kitten icat"
alias emacs="emacs -nw"
alias neofetch=" neofetch --backend kitty --source ~/M4in/pictures/mcp.jpg --package_managers off --gtk_shorthand off --gtk2 off --gtk3 off --uptime_shorthand tiny --size 270px --memory_display off"
alias copy='xclip -sel clip'
alias tock='tock -m -c -s -C=6'
alias vim='nvim'
alias nv='nvim'
alias imshow='sxiv -a -b -t ./*'
alias lg='lazygit'
alias cpwd='pwd | copy'
alias screenkey='screenkey --scr 0 -s small -f "Office Code Pro" --opacity 0.5'
alias nnn="nnn -e -a"
alias corona="curl https://corona-stats.online/"
alias mpv="devour mpv"
alias yt="ytfzf -t"
alias kssh="kitty +kitten ssh"

# EXPORT SECTION #

# Setting up the nnn options.
export NNN_BMS='w:~/M4in/pictures/wallbase;p:~/M4in/pictures;s:~/M4in/universities/master/semesters/;C:~/M4in/code/;b:~/M4in/books/;d:~/M4in/;c:~/.config/;m:/media/'
export NNN_NOTE='~/M4in/notes.txt'
export NNN_USE_EDITOR=1
export NNN_PLUG='s:sxiv;c:code;z:zathura;v:vlc;g:_lazygit;p:preview-tui'
export NNN_COLORS='3627'
export BAT_THEME='Monokai Extended Bright'
export NNN_FCOLORS='0000daa100c67bbd000000d0'
export VISUAL=nvim              
export USE_VIDEOTHUMB=1

# Other exports.
export XLA_FLAGS='--xla_gpu_cuda_data_dir=/opt/cuda'  # For JAX.
export TERM=xterm-kitty
export PATH=$PATH:$HOME/.cargo/env             # For rust.
export PATH=$PATH:$HOME/go/bin                 # For go.
export LD_LIBRARY_PATH=/usr/local/cuda/lib64   # For tensorflow.
export PYTHONPATH="/home/h4pz/Repos/"          # For kitty backend.

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/h4pz/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/h4pz/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/h4pz/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/h4pz/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# <<< conda initialize <<<xport LESS=-r

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Prompt.
setopt prompt_subst
PROMPT="%F{238}$USER-Λ%f %B%{$fg[yellow]%}%(4~|%-1~/.../%2~|%~)%u%b %{$fg[yellow]%}>%B%{$reset_color%}%b "


# FZF
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
