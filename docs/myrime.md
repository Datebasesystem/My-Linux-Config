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

Q: How to get app Bundle Identifier?
- mac 中打开application，右键，点击显示包内容
- 找到 Contents/info.plist, 打开
- 找到配制 CFBundleIdentifier

或者：
- 执行 osascript -e 'id of app "微信"' 的命令，把微信 替换为 interest app
- *[how to find Bundle Id](https://simplemdm.com/blog/how-to-find-the-bundle-id-for-an-application/)
按照这个名子，配制其输入法

*[说明文档](https://github.com/rime/home/wiki/CustomizationGuide#%E4%B8%80%E4%BE%8B%E5%AE%9A%E8%A3%BD%E5%B0%8F%E7%8B%BC%E6%AF%AB%E9%85%8D%E8%89%B2%E6%96%B9%E6%A1%88)
配制文件在 squirrel.custom.yaml 中

## 技巧
将mac 的capslock切换输入法禁用，就可以只用 Rime 输入法了
配制为：
  使用大写锁定键切换 “ABC” 输入法
