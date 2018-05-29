# 代理配置文档

## 基础方案

优点: 图形界面操作, 操作简单

缺点: 缺乏命令行代理支持, 效率低, 不支持自动判断, 速度慢, 不支持加速服务

#### 安装过程:

- 安装 shadowsocksx-ng ，可以使用`brew cask install shadowsocksx-ng`命令一键安装。或者点击[链接安装](https://github.com/shadowsocks/ShadowsocksX-NG)。
- 安装成功后，导入二维码。下面的二维码第一个是美国的代理服务器，第二个日本的代理服务，二选一即可。

美国
![us-qrcode](https://git.beansmile-dev.com/max/proxy/uploads/f1d4f4ccfc9a463ce6e25599fd80bc24/us-qrcode.png)

日本
![jp-qrcode](https://git.beansmile-dev.com/max/proxy/uploads/61270f02693072c0940f529d6a4c5181/jp-qrcode.png)



- [**可选**] 如果你的客户端不支持扫码添加配置，请手动输入配置，两台代理服务器配置一样


美国代理服务器配置：

IP：`207.148.22.68`

Port: `3389`

Encryption：`aes-256-cfb`

Key： `iChLy8PsUm2v$44r.7$2WpG)Zoii)gbs#PD$DMAPVRc4z;ZXsnUXCC+n29#Lq9Qz`



日本代理服务器配置：

IP：`207.148.90.78`

Port: `3389`

Encryption：`aes-256-cfb`

Key： `iChLy8PsUm2v$44r.7$2WpG)Zoii)gbs#PD$DMAPVRc4z;ZXsnUXCC+n29#Lq9Qz`



## 推荐方案

优点: 命令行操作, 支持加速, 速度快, 支持命令行代理

缺点: 如何本地配置文件 `/usr/local/etc/v2ray/config.json` 速度峰值开的太大, 在家庭宽带网络下（公司属于企业宽带，所以没这种问题）有可能被截流

#### 安装过程:

1. 克隆仓库 `git clone git@git.beansmile-dev.com:max/proxy.git`
2. 执行安装脚本 `bash proxy/client/start.sh`
3. 打开一个新的窗口. 执行 `setproxy` 开启代理(`unsetproxy` 就是关闭代理)
4. 打开浏览器, 访问 Google 测试一下，如果可以访问，说明图形界面可以翻墙了。
5. 命令行端也支持代理，在一个新的命令行窗口里，当你执行完这份脚本后，每个新打开的命令行窗口都是默认走代理的。执行 `testproxy` , 如果输出 Google 说明命令行可以翻墙了。如果你想要当前命令行窗口不走代理（只对当前命令行窗口有效），执行 `unsetttyproxy`，`setttyproxy`命令可以再次让当前窗口恢复到代理模式。
6. 更多命令行命令请查看当前项目 client 文件夹下的 `README.md`。



## FAQ

Q：我同时使用了推荐方案和基础方案，参数配置都正确，就是上不去怎么办？

A：你本地的 Shadowsocksx-ng 客户端端口可能跟推荐方案中的客户端端口冲突了。请修改Shadowsocksx-ng 客户端本地监听端口。

## 参考链接

[推荐方案的官方文档](https://www.v2ray.com/)

[推荐方案的设计文档](./docs/v2ray.md)