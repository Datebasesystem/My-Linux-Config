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
alias s="source ~/.bashrc"
alias h="cd /data/ssd1/user"
alias 1="cd /data/ssd1/user/redtable_1/redzippydb"
alias 1b="cd /data/ssd1/user/redtable_1/BIN"

## 配置Cgroup 防止 vim 打爆内存
alias nvim="cgexec -g memory:nvim_cgroup /data/ssd1/user/neovim/nvim.appimage"

# Export
export PATH="/data/ssd1/user/ccls_pack/ccls/build/Release/bin:$PATH"
export PATH="/data/ssd1/user/neovim/bin:$PATH"
export PATH="/data/ssd1/user/mysql/mysql-build/bin:$PATH"
export LD_LIBRARY_PATH=/opt/redzippydb/toolset/gcc/7.5.0/lib64:$LD_LIBRARY_PATH
export PS1="[\[\e[1;35m\]\u\[\e[0m\]@\[\e[1;35m\]\h\[\e[0m\]:\[\e[1;36m\]\t\[\e[0m\] \[\e[1;32m\]\${PWD}/\[\e[0m\]]\n\[\e[1;34m\]$ \[\e[0m\]"

