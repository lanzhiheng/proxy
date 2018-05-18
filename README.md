# 代理配置文档

## 基础方案

#### 优点: 图形界面操作, 操作简单

#### 缺点: 缺乏命令行代理支持, 效率低, 不支持自动判断, 速度慢, 不支持加速服务

#### 安装过程:

1. 安装 shadowsocksx

2. 导入二维码

   ![qrcode](https://git.beansmile-dev.com/max/proxy/uploads/749251651f2066d0943ab5a7a914476e/Screenshot_2018-05-18_10.02.00.png)

## 推荐方案

#### 优点: 命令行操作, 支持加速, 速度快, 支持命令行代理

#### 缺点: 速度太快, 在家庭宽带有可能被截流

#### 安装过程:

1. 克隆仓库 `git clone git@git.beansmile-dev.com:max/proxy.git`
2. 进入仓库 ` cd proxy/client`
3. `bash start.sh`
5. 打开一个新的窗口. 执行 `setproxy`
6. 打开浏览器, 访问 Google 测试一下吧
4. 查看更多说明请查看 client 文件夹下的 README