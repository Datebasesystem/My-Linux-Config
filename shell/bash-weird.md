# 双引号

在对于含有空格的可以采用双引号包围，但是
$var 的时候自动去掉双引号
```sh
set -x
entries=(
  "cpu family"
)

for i in "${entries[@]}"; do
  cat /proc/cpuinfo | grep "$i" | tee a
done
```
## glob, spliting and empty remove

ust like in any argument to any command, variable expansions must be quoted to prevent split+glob and empty removal

```txt
[[ $1 == ?(-)+([0-9]) ]] && echo "$1 is an integer"
```
- https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash : 理解下这里的绝活。

c


## 这个为什么失败？
printf "-- %s ---" $a

## 数值系统太弱了
仅仅支持整数，不然就是 awk 或者 bc
$((1 + 2))

还需要手动判断是不是整数:
is_uint() { case $1 in '' | *[!0-9]*) return 1 ;; esac }

## 命令成功
https://unix.stackexchange.com/questions/22726/how-to-conditionally-do-something-if-a-command-succeeded-or-failed

测试命令成功:
```txt
if command ; then
    echo "Command succeeded"
else
    echo "Command failed"
fi
```

## 到底什么时候添加双引号
我认为 shellcheck 说不可以的都不可以。

### intensionally word spliting

- https://stackoverflow.com/questions/62637465/how-to-be-explicit-about-intentional-word-splitting

read -ra gcc_options <<<"${OPTIONS}"
gcc "${gcc_options[@]}"

### intensionally glob

a=$(echo *.md)
echo "$a"

## [ ]  printf 的高级操作

```txt
printf '%s\n' "${m[@]}"
# TODO 我超，这个功能这么神奇啊
printf "abc %s efg\n" $a
echo "$a"
```

## 区分 glob 和 regex

```txt
str="aabc"
if [[ $str =~ .*bc ]];then
  echo "gg"
fi
```


## 仅仅是 if else
- [ bar = "$foo" ] && [ foo = "$bar" ] # Right! (POSIX)
- [[ $foo = bar && $bar = foo ]]       # Also right! (Bash / Ksh)

但是不可以是其他的风格:

if [[ bar = "$foo" ]]; then …

- 这里的讲究: 是所有的空格都不可以省掉。

[[ $foo == $bar ]] 还是 [[ $foo == "$bar" ]]

## 恐怖的双引号
1. QEMU 中，曾经为什么使用 eval
2. 如果想要让执行的命令看到双引号，应该如何操作？
  - 如果不想，如何操作
3. 双引号让 array 还是 string 非常的模糊

```txt
function test_para() {
  echo "$0"

  for i in "${@:2}"; do
    echo "$i"
  done

}
```
4. Assigning an array to a string! Assign as array, or use * instead of @ to concatenate. [2124] (shellcheck)
  - 为什么需要使用 * 而不是 @ 符号
```txt
function launch() {
	tag="$1"
	node="$2"
	others="${*:3}"
	others="${@:3}"
```
5. 最后执行成为这个样子，可以理解吗？
  - javca -jar /tmp/jenkins-cli.jar - NODE=kernel-x86_64-jenkins-3 'a=B c=D'