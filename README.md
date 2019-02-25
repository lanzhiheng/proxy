# Usage
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
    
    Setup property permission
    ```
    sudo sh -c 'echo "%admin ALL = (ALL) NOPASSWD:/usr/sbin/networksetup" >> /etc/sudoers' 
    ```
3. **import shell config**
    
    If you use bash shell
    ```
    source ~/.bash_profile
    ``` 
    
    **[option]** If you use zsh shell
    ```
    source ~/.zshrc
    ```
4. **Download dependency**
    ```
    proxy init
    ```

5. **Start your proxy**
    ```
    proxy start
    ```
    
6. **Figure out more usage**
    ```
    proxy help
    ```

7. **[option] Setup terminal proxy**
    
    If you use bash shell
    ```
    echo -e "export http_proxy='http://127.0.0.1:9090'\nexport https_proxy='http://127.0.0.1:9090'" >> ~/.bash_profile
    ```
    **[option]** If you use zsh shell 
    ```
    echo -e "export http_proxy='http://127.0.0.1:9090'\nexport https_proxy='http://127.0.0.1:9090'" >> ~/.zshrc
    ```
    
8. **[option] Temporarily unset terminal proxy**
    ```
    unset http_proxy && unset https_proxy
    ```

9. **[option] Persistently unset terminal proxy**
    
    delete the follow lines in your `.bash_profile` or `.zshrc`
    ```
    export http_proxy='http://127.0.0.1:9090'
    export https_proxy='http://127.0.0.1:9090'
    ```
    
# iOS proxy config

1. **login Beansmile Apple ID**
    
    username: `devops-team@beansmile.com`
    
    password: `Bean.smile#2018`

2. **download Shadowrocket**
3. **Scan QR code with Shadowrocket**
    
    - **proxy master QR code**
    ![proxy-master](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/74320988d5223d25f4cc89bb3eeac5ec/IMG_0382.jpeg)
    
    - **proxy backup QR code**
    ![proxy-backup](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/40fda7769992bfafddd2f66d70094878/dNwyo9kITE+7AFHAMnTb3g_thumb_2d7.jpg)
    
    - **proxy ladder QR code**
    ![proxy-ladder](https://git.beansmile-dev.com/beansmileteam/proxy/uploads/515150e6580e78ea937036ee9e447d3c/seeJcoXZQs6NnM6kh5CQ4A_thumb_2d8.jpg)