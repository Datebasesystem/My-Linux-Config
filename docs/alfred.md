# 序

Alfred 是 Mac 上很好用的快捷键，通过它可以很方便的设置多屏之间跳转的方案。

# 用法
将 ../alfred/screen-switch.alfredworkflow 这个文件导入到 Alfred 中

## 踩坑
1. 屏幕跳转主要依赖 cliclick 来实现。cliclick 有一些小坑。
| | | |
| --| --| --|
| 打印当前鼠标位置| cliclick p | 可以确定鼠标点击的准确位置|
| 点击负点的位置 | cliclick c:="-11,99" | 如果是负数，需要:= |
