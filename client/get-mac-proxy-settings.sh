networksetup -getwebproxy Wi-Fi
echo -------------------------------
networksetup -getsecurewebproxy Wi-Fi
echo -------------------------------
networksetup -getsocksfirewallproxy Wi-Fi
echo -------------------------------
echo "http_proxy=${http_proxy:-Null}"
echo ---------------------------------
echo "https_proxy=${https_proxy:-Null}"
