sudo networksetup -setwebproxy Wi-Fi 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy Wi-Fi 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate Wi-Fi off &>/dev/null
sudo networksetup -setwebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setwebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsecurewebproxy 'Thunderbolt Ethernet' 127.0.0.1 8118 off &>/dev/null
sudo networksetup -setsocksfirewallproxystate 'Thunderbolt Ethernet' off &>/dev/null
sudo networksetup -setproxybypassdomains 'Wi-Fi' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null
sudo networksetup -setproxybypassdomains 'Ethernet' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null
sudo networksetup -setproxybypassdomains 'Thunderbolt Ethernet' '*.example.com 192.168.0.0/16 10.0.0.0/8' &>/dev/null