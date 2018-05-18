sudo networksetup -setproxybypassdomains 'Wi-Fi' *.example.com *.bilibili.com 192.168.0.0/16 10.0.0.0/8 &>/dev/null
sudo networksetup -setproxybypassdomains 'Ethernet' *.example.com *.bilibili.com 192.168.0.0/16 10.0.0.0/8 &>/dev/null
sudo networksetup -setproxybypassdomains 'Thunderbolt Ethernet' *.example.com *.bilibili.com 192.168.0.0/16 10.0.0.0/8 &>/dev/null