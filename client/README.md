# 客户端配置文档
## 安装方法
1. 下载仓库: `git clone git@git.beansmile-dev.com:beansmile.com/devops.git`
2. 进入文件夹: `cd devops/v2ray/client`
3. 执行配置脚本: `bash start.sh`
4. 等待完成后, 查看最后的说明文档
5. 打开一个新的窗口. 执行 `setproxy`
6. 打开浏览器, 访问 Google

## 说明
- 命令行命令 `setproxy`: 设置socks代理, 相当于图形界面全局代理
- 命令行命令 `unsetproxy`: 取消socks代理
- 命令行命令 `sethttpproxy`: 设置http代理, 相当于图形界面全局代理
- 命令行命令 `setttyproxy`: 设置命令行代理, 图形界面和命令行界面是两个世界,
- 这个命令相当于命令行的全局代理
- 命令行命令 `getproxy`: 参看当前代理设置情况

## FAQ
Q: 怎么没有自动代理的命令?

A: v2ray 是自动判断 IP 的, 国外的网站才走代理的, 国内不走代理, v2ray 原理上就是自动代理了

Q: 如果还是有判断不合理的时候怎么办?

A: 这种情况多发生在浏览国内的网站时, 我一般会执行 unsetproxy 关掉代理, 等操作结束再 setproxy 打开代理 
