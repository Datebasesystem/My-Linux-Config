
## 前言
VIM 的快速配置方案


## 安装
### 安装neovim

安装 neovim 的方案有很多，当前配置需要 neovim 0.9 以上的版本，建议使用预编译版本，自己编译 neovim 不仅时间比较长，还需要`GLIBC_2.29' 版本，比较难升级。

[neovim 预编译版本下载](https://github.com/neovim/neovim-releases/releases)。

目前看预编译版本为NVIM v0.10.2，已经很新了，直接下载 nvim.appimage 。
```
./nvim.appimage 
alias nvim="/user/neovim/nvim.appimage"
```

### 安装 ccls
ccls 是负责代码跳转，整体感觉比 vscode 准很多。但是 CentOS 没办法直接通过 yum 安装，需要自己编译。不过这个整体很小，编译很简单。

1. 下载 clang+llvm
 下载预编译的二进制 "[Pre-Built Binaries](https://releases.llvm.org/download.html
)"。

2. 解压到目录下，软连接到/path/to 中。

```
tar -xvf clang+llvm-18.1.8-x86_64-xxxx
ln -s /user/clang+llvm-18.1.8-x86_64-xxxx /path/to/clang+llvm-18.1.8-x86_64-xxxx
```

3. 下载 ccls

```
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
mkdir build
cd build
cmake -S.. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/path/to/clang+llvm-18.1.8
cmake --build Release -j
```

4. 添加到 path 中：
```
vim ~/.bashrc

export PATH="$PATH:~/ccls/bin"

```

5. 执行 ccls 测试
```
ccls
```

### 剪切板配置
剪切板这里我使用的自己的脚本，通过 clipboard-provider实现跨剪切板操作。脚本在
scripts/bin/clipboard-provider 中。把这个添加到 PATH 即可。
```
export PATH="$PATH:~/dotfiles/scripts/bin"
```

随后执行下： echo my_xxxx | clipboard-provider copy

看是否能把my_xxxx 复制到系统剪切板中，如果可以就没问题。

###  安装本配置

1. 备份
```
mv ~/.config/nvim ~/.config/nvim.bak # 保存原有配置
cd ~ # 保证在根目录下
```
2. 配置
```
git clone --depth=1 https://github.com/martins3/My-Linux-config .dotfiles # 随便什么名字
ln -s ~/.dotfiles/nvim ~/.config/nvim # 创建一个软链接指向此处
nvim
```
此时 nvim 会打开比较慢，跑一些基本的下载，稍等一会。

3.手动安装某些插件
```
markdown-preview.nvim
cd ~/.local/share/nvim/lazy/markdown-preview.nvim/app && npm install
```

至此，基本的 nvim 安装就 ok 了。


## 改动
1. 剪切板使用clipboard-provide
2. 增加了 telescope 忽略路径：build，build-debug，build-release

## 问题
1. 貌似 nvim 开 session 会出现问题，总是闪退


