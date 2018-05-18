sudo networksetup -setsocksfirewallproxy 'Wi-Fi' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Wi-Fi' off &>/dev/null
sudo networksetup -setwebproxystate 'Wi-Fi' off &>/dev/null
sudo networksetup -setsocksfirewallproxy 'Thunderbolt Ethernet' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setwebproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setsocksfirewallproxy 'Ethernet' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Ethernet' off &>/dev/null
sudo networksetup -setwebproxystate 'Ethernet' off &>/dev/null
source ~/Dropbox/bash/set-mac-proxy-bypass-domain.sh
