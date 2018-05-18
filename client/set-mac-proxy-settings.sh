sudo networksetup -setsocksfirewallproxy 'Wi-Fi' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Wi-Fi' off &>/dev/null
sudo networksetup -setwebproxystate 'Wi-Fi' off &>/dev/null
sudo networksetup -setsocksfirewallproxy 'Thunderbolt Ethernet' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setwebproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setsocksfirewallproxy 'Ethernet' 127.0.0.1 1086 &>/dev/null
sudo networksetup -setsecurewebproxystate 'Ethernet' off &>/dev/null
sudo networksetup -setwebproxystate 'Ethernet' off &>/dev/null
sudo networksetup -setproxybypassdomains 'Wi-Fi' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null
sudo networksetup -setproxybypassdomains 'Ethernet' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null
sudo networksetup -setproxybypassdomains 'Thunderbolt Ethernet' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null