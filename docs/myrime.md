## 前言
rime 的输入法的配制方案


## 安装
网站上直接下载安装包。
备份历史配制

```
mv ~/Library/Rime ~/Library/Rime-bak
```

把当前配制软链接过去

```
ln -s ~/dotfiles/Rime ~/Library/Rime
```

## 优势

1. 可以配制不通软件的默认输入法，切换超快
a. mac 中打开application，右键，点击显示包内容
b. 找到 Contents/info.plist, 打开
c. 找到配制 CFBundleIdentifier
d. 按照这个名子，配制其输入法
