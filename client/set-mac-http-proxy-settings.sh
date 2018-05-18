sudo networksetup -setwebproxy Wi-Fi 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate Wi-Fi off &>/dev/null
sudo networksetup -setwebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setwebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate 'Thunderbolt Ethernet' off &>/dev/null
source ~/Dropbox/bash/set-mac-proxy-bypass-domain.sh
