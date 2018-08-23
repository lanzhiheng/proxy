check(){
	sudo networksetup -listallnetworkservices | grep ^$1$ &>/dev/null
	if [[ $? -eq 0 ]];then
		return 0
	else
		return 1
	fi
}

check "Wi-Fi"
if [[ $? -eq 0 ]];then 
echo --------------- Wi-Fi ----------------
networksetup -getwebproxy 'Wi-Fi'
echo --------------- Wi-Fi ----------------
networksetup -getsecurewebproxy 'Wi-Fi'
echo --------------- Wi-Fi ----------------
networksetup -getsocksfirewallproxy 'Wi-Fi'
fi

check "Thunderbolt Ethernet"
if [[ $? -eq 0 ]];then
echo --------------- Thunderbolt Ethernet ----------------
networksetup -getwebproxy 'Thunderbolt Ethernet'
echo --------------- Thunderbolt Ethernet ----------------
networksetup -getsecurewebproxy 'Thunderbolt Ethernet'
echo --------------- Thunderbolt Ethernet ----------------
networksetup -getsocksfirewallproxy 'Thunderbolt Ethernet'
fi

check "Ethernet"
if [[ $? -eq 0 ]];then
echo ---------------  Ethernet ----------------
networksetup -getwebproxy 'Ethernet'
echo ---------------  Ethernet ----------------
networksetup -getsecurewebproxy 'Ethernet'
echo ---------------  Ethernet ----------------
networksetup -getsocksfirewallproxy 'Ethernet'
fi
echo -------------------------------
echo "http_proxy=${http_proxy:-Null}"
echo ---------------------------------
echo "https_proxy=${https_proxy:-Null}"
