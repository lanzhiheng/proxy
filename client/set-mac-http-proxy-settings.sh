sudo networksetup -setwebproxy Wi-Fi 127.0.0.1 8118 off
sudo networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8118 off
sudo networksetup -setsocksfirewallproxystate Wi-Fi off
source ~/Dropbox/bash/set-mac-proxy-bypass-domain.sh
