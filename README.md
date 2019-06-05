## table of contents
<!-- vim-markdown-toc GitLab -->

* [Attention](#attention)
* [Mac proxy config](#mac-proxy-config)
  * [setup](#setup)
  * [advanced](#advanced)
* [iOS proxy config](#ios-proxy-config)
* [Android proxy config](#android-proxy-config)
* [Windows proxy config](#windows-proxy-config)

<!-- vim-markdown-toc -->

## Attention

**Do not change your date manually, which will cause your proxy down**

**不要手动修改你的系统时间. 否则你可能会由于时间戳错误导致代理失效**

## Mac proxy config

### setup
1. **Install**
    ```
    git clone git@git.beansmile-dev.com:beansmileteam/proxy.git ~/.proxy
    ```

2. **Setup**

    If you use bash shell
    ```
    echo 'export PATH="$PATH:$HOME/.proxy"' >> ~/.bash_profile
    ```

    **[option]** If you use zsh shell
    ```
    echo 'export PATH="$PATH:$HOME/.proxy"' >> ~/.zshrc
    ```

3. **Setup property permission**

    ```
    sudo sh -c 'echo "%admin ALL = (ALL) NOPASSWD:/usr/sbin/networksetup" >> /etc/sudoers'
    ```

4. **import shell config**

    If you use bash shell
    ```
    source ~/.bash_profile
    ```

    **[option]** If you use zsh shell
    ```
    source ~/.zshrc
    ```

5. **Download dependency**
    ```
    proxy init
    ```

6. **Start your proxy**
    ```
    proxy start
    ```
    You can visit google now. Open Safari and try it yourself.

### advanced
1. **[option] Setup terminal proxy**

    If you use bash shell
    ```
    echo -e "export http_proxy='http://127.0.0.1:9090'\nexport https_proxy='http://127.0.0.1:9090'" >> ~/.bash_profile && source ~/.bash_profile
    ```
    **[option]** If you use zsh shell
    ```
    echo -e "export http_proxy='http://127.0.0.1:9090'\nexport https_proxy='http://127.0.0.1:9090'" >> ~/.zshrc && source ~/.zshrc
    ```

2. **[option] Temporarily unset terminal proxy**

    ```
    unset http_proxy && unset https_proxy
    ```

3. **[option] Persistently unset terminal proxy**

    delete the follow lines in your `.bash_profile` or `.zshrc`
    ```
    export http_proxy='http://127.0.0.1:9090'
    export https_proxy='http://127.0.0.1:9090'
    ```

4. **[option] Figure out more usage**

    ```
    proxy help
    ```

## iOS proxy config

1. **Login Beansmile Apple ID**

    username: `devops-team@beansmile.com`

    password: `Bean.smile#2018`

2. **Download Shadowrocket**
3. **Scan QR code with Shadowrocket**

  - **iOS proxy QR code**

  ![proxy-master](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/3927aad3c2a3db283d816a535d6f5467/master_ios.png)

## Android proxy config

1. **Download V2rayNG [Universal Release]**

    [click here to download](https://github.com/2dust/v2rayNG/releases)

2. **Scan QR code with V2rayNG**

  - **Android proxy QR code**

  ![master](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/dccfb013926945b81e0e11d35e2404c6/master_android.png)

## Windows proxy config

1. Download v2rayN-Core.zip: https://github.com/2dust/v2rayN/releases

2. Copy your windows config into your clipboard

    **config**
    ```
    vmess://eyJhZGQiOiJtYXN0ZXIuYmVhbnNtaWxlLWRldi5jb20iLCJhaWQiOiIxNiIsImhvc3QiOiIiLCJpZCI6IjgwMTI0YjIyLWJjMzYtNDZmZS1hMmVjLTY1MDA4NDZmMjI1MSIsIm5ldCI6IndzIiwicGF0aCI6Ii9oaSIsInBvcnQiOiI0NDMiLCJwcyI6Im1hc3RlciIsInRscyI6InRscyIsInR5cGUiOiJub25lIiwidiI6IjIifQ==
    ```

3. Import config

    ![import.png](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/ee196daa7461969be076761108568551/image.png)

4. Enable proxy

    ![enable1.png](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/fb393c790da61d83313d00d03a8e7329/image.png)

5. Chose proxy mode

    ![enable.png](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/b37401c8608b46b0ccf53756734f5cbb/image.png)

6. Chose your proxy server that you wanna use

    ![use.png](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/267318fed3a3faf4ad0083d25459b228/image.png)

7. Enable auto start

    ![autoStart.png](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/65fcdbdbdb716b8baa495e878f8526c8/image.png)
