# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
  docker
  docker-compose
)

bindkey '`' autosuggest-accept

source $ZSH/oh-my-zsh.sh

# User configuration
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt nonomatch

alias v='vim'
alias e='exit'
alias tree='tree -N'
alias c=clear
alias s='sdcv'
alias open='nautilus'
#解决下载文件的文件名乱码问题
alias myrecover='test() { mv $1 $(echo -n $1 | iconv -f UTF-8 -t ISO-8859-1 | iconv -f gbk -t utf8);}; test'
#解决下载文件的内容乱码问题
alias mytrans='test() {  iconv -f gbk -t utf8 $1>$1.t; mv $1.t $1}; test'
alias myTcpkeepaliveOpen=" sudo pmset -b tcpkeepalive 1 "
alias myTcpkeepaliveClose=" sudo pmset -b tcpkeepalive 0 "

alias pycharm="~/pycharm-2018.3.5/bin/pycharm.sh"
alias gpu-monitor="watch -n 1 nvidia-smi"
#alias tensorboard='python /home/lima-yz/anaconda3/envs/roboMaster/lib/python3.7/site-packages/tensorboard/main.py'

#proxy
export http_proxy="http://127.0.0.1:12333"
export https_proxy="http://127.0.0.1:12333"
#export ALL_PROXY="socks5://127.0.0.1:1087"

#cuda 9
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64$LD_LIBRARY_PATH
#cuda 8
#export PATH=/usr/local/cuda-8.0/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64$LD_LIBRARY_PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/lima-yz/.mujoco/mujoco200/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia-384
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so


# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/lima-yz/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/lima-yz/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lima-yz/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/lima-yz/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
source activate ros_env
#source activate roboMaster
#source activate deepPILCO
#conda deactivate
#conda activate rmaiEnv

#IP=$(ip addr show wlx40a5eff46019 | grep -w inet | awk '{print $2}' | awk -F / '{print $1}')
#IP=$(ip addr show wlx30b49ed22d32 | grep -w inet | awk '{print $2}' | awk -F / '{print $1}')

export ROS_MASTER_URI=http://localhost:11311

#export ROS_MASTER_URI=http://192.168.123.121:11311
#export ROS_MASTER_URI=http://192.168.123.244:11311
#export ROS_IP=${IP}
#export ROS_HOSTNAME=${IP}

source /opt/ros/kinetic/setup.zsh
#source ~/catkin_ws/devel/setup.zsh
source ~/Desktop/rmai_ws/devel/setup.zsh  --extend
#source ~/Desktop/rmai_ws/devel/setup.zsh 
#source ~/Desktop/pilco_ws/devel/setup.zsh 
#source ~/Desktop/robotics_hw_ws/devel/setup.zsh
#source ~/Desktop/test_ws/devel/setup.zsh 
#source ~/carto_catkin_ws/install_isolated/setup.zsh --extend



autoload -U compinit && compinit


#export PATH="$HOME/anaconda3/envs/rllab3/bin:$PATH"
#export PYTHONPATH="$HOME/rllab:$PYTHONPATH"
#source activate rllab3


## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/lima-yz/anaconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/lima-yz/anaconda2/etc/profile.d/conda.sh" ]; then
#        . "/home/lima-yz/anaconda2/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/lima-yz/anaconda2/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
