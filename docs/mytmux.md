# 序
我的 tmux 配置基本是基于 oh-my-tmux 做的改动，增加了一些个性化颜色配置，以及小工具。


# 安装
## 下载本配置

```
git clone --depth=1 https://github.com/Datebasesystem/My-Linux-Config.git .dotfiles # 随便什么名字

ln -s ~/.dotfiles/my-tmux/.tmux.conf ~/.tmux.conf # 创建一个软链接指向此处
ln -s ~/.dotfiles/my-tmux/.tmux.conf.local ~/.tmux.conf.local # 创建一个软链接指向此处

```
## 编译 cpu 显示小组件
```
cd dotfiles/my-tmux/tmux-mem-cpu-load

cmake .
make -j4

# 添加到 PATH 中
# export PATH = xx/tmux-mem-cpu-load

```
## 启动tmux

```
tmux
```
