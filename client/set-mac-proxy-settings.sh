sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 1086
#sudo networksetup -setsocksfirewallproxy 'Thunderbolt Ethernet' 127.0.0.1 1086
sudo networksetup -setsecurewebproxystate Wi-Fi off
sudo networksetup -setwebproxystate Wi-Fi off
#sudo networksetup -setwebproxy Wi-Fi 127.0.0.1 8118 off
#sudo networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8118 off
source ~/Dropbox/bash/set-mac-proxy-bypass-domain.sh
