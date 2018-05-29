# v2ray 推荐方案一键安装脚本设计文档

## 方案概述

用命令行的方式管理本机的代理服务。主要通过以下的命令管理本地的代理服务：

* 开启图形界面代理。`setproxy`
* 关闭图形界面代理。 `unsetproxy`
* 开启命令行界面代理。`setttyproxy`
* 关闭命令行界面代理。`unsetttyproxy`
* 测试命令行界面代理是否正常。`testproxy`
* 其他可用命令 `sethttpproxy` `unsethttpproxy` `getservices`
* 查看本机的代理设置情况 `getproxy`

除了 `unsetttyproxy` 的所有命令相当于一个开关，所以即使 Mac 重启也有效。

## 方案细节

推荐方案主要通过 start.sh 脚本进行安装。脚本设计细节如下（按脚本执行步骤先后进行说明）。

1. 检查本地是否安装了 Homebrew ，没有则安装。`checkHomebrew` `downloadHomebrew`
2. 检查是否安装了 v2ray. 没有则用 Homebrew 安装 。 `downloadV2ray`
3. 检查是否安装了 privoxy. 没有则用 Homebrew 安装。`downloadPrivoxy`
4. 检测本地shell类型，判断当前用户用的是 zsh 还是bash。`checkShell`
5. 检查后面的操作是否用户已经做过，做过则跳过`checkProfile`，没做过则添加定制好的 alias 命令到检测得到的 shell（不同 shell 配置文件路径不同） 的配置文件中，实现定制的命令。
   `checkProfileConfig`
6. 将 mac 上控制代理开关的命令封装成 bash 脚本文件。我们检查存放这些脚本的目录是否存在，不存在我们就创建这个目录 `checkConfigDir`
7. 将控制代理开关的脚本拷贝到指定目录中 `cpSetupScript`
8. 将本地的 `v2ray` 配置文件拷贝到指定的目录下，并重启 `v2ray` 确保生效 `setupV2ray`
9. 将本地的 `privoxy` 配置文件拷贝到指定的目录下，并重启 `privoxy` 确保生效 `setupPrivoxy`
10. 因为我们设置本地的代理开关需要高级权限，所以我们允许代理开关设置免验证 `checkSudo` `setSudo`
11. 输出帮助文档

文件说明

```
client
├── README.md 
├── get-mac-network-services.sh
├── get-mac-proxy-settings.sh
├── privoxy.conf
├── restore-mac-proxy-settings.sh
├── set-mac-http-proxy-settings.sh
├── set-mac-proxy-settings.sh
├── start.sh
└── v2ray.json
```

`set*` `get*` `restore*` 开头的文件是第六和第七步说到的控制脚本

`v2ray.json` 是本地 v2ray 客户端配置文件，第八步会用到

`privoxy.conf` 是本地 privoxy 配置文件，第九步会用到

## FAQ

Q: 如果我有两台 Mac 电脑，如何让我的翻墙配置和控制命令在两台电脑自动同步，保证两台电脑的操作一致？

A: 在第七我们将控制脚本拷贝到了一个指定目录中，这个指定目录我设置在了 `~/Dropbox/bash`或者 `~/Dropbox/zsh`（根据你使用的shell的不同而不同）。如果你有用 `Dropbox`，在两台 Mac 上登录同一个账号，`Dropbox` 就会自动同步这些配置文件。一样的原理。如果你要确保指令一致，假设你用的是 `bash`，那么把 `bash` 存放个人配置的文件 `.profile` 剪切到 `~/Dropbox/` 下，然后新建一个软连接到原文件路径，并指向  `~/Dropbox/` 中的 `.profile` ，从而替代它。两台 Mac 都这么做。这样我们的 `bash` 配置文件也就在两台 Mac 上自动同步了



