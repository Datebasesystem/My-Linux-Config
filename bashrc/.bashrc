# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#User specific aliases and functions

# Used port start 10000
# Next avaliable port 10000

# alias

# cancel all alias
unalias -a

alias s="source ~/.bashrc"
alias h="cd /data/ssd1/user"
alias 1="cd /data/ssd1/user/"
alias 1b="cd /data/ssd1/user/mysql/BIN"

## 配置Cgroup 防止 vim 打爆内存
alias init_nvim="sudo cgcreate -g memory:nvim_cgroup; sudo chown -R $USER:$USER /sys/fs/cgroup/memory/nvim_cgroup; echo '10G' > /sys/fs/cgroup/memory/nvim_cgroup/memory.limit_in_bytes"
alias nvim="cgexec -g memory:nvim_cgroup /data/ssd1/yichen/neovim/nvim.appimage"

alias catcg='ps -p $(cat /sys/fs/cgroup/memory/nvim_cgroup/tasks)'
alias tailf='tail -f'
alias format='git diff -U0 --no-color HEAD | clang-format-diff.py -p1 -i'

make() {
    if [[ "$*" =~ ^-j[0-9]+$ ]]; then
        command make "$@"
    elif [[ "$*" == "" ]]; then
        command make -j10
    else
        echo "Error: make -j must be followed by a number" >&2
        return 1
    fi
}

# Export
export PATH="/data/ssd1/user/ccls_pack/ccls/build/Release/bin:$PATH"
export PATH="/data/ssd1/user/neovim/bin:$PATH"
export PATH="/data/ssd1/user/mysql/mysql-build/bin:$PATH"
export LD_LIBRARY_PATH=/opt/toolset/gcc/7.5.0/lib64:$LD_LIBRARY_PATH
export PS1="[\[\e[1;35m\]\u\[\e[0m\]@\[\e[1;35m\]\h\[\e[0m\]:\[\e[1;36m\]\D{%Y-%m-%d %H:%M:%S}\[\e[0m\] \[\e[1;32m\]\${PWD}/\[\e[0m\]]\n\[\e[1;34m\]$ \[\e[0m\]"

base_dir_1=/data/ssd1/user/table_1/BIN
alias pp="ps -ef | grep -v grep | grep -v gdb | grep ${base_dir_1}"

meta_port_1=10001
alias ssm="${base_dir_1}/bin/mysqld --flagfile ${base_dir_1}/conf/metad.conf"
alias xxm="lsof -t -i :${meta_port_1} | xargs kill -9"
alias oom="tail -f -n 200 ${base_dir_1}/logs/mysqld.INFO"
alias eem="nvim ${base_dir_1}/conf/metad.conf"


