#!/bin/bash
# If not specify, default meaning of return value:
# 0: Success
# 1: System error
# 2: Application error
# 3: Network error

CONFIG_DIR="Dropbox"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROFILE=""

#######color code########
RED="31m"      # Error message
GREEN="32m"    # Success message
YELLOW="33m"   # Warning message
BLUE="36m"     # Info message

colorEcho(){
  COLOR=$1
  echo -e "\033[${COLOR}${@:2}\033[0m"
}

# check homebrew 
checkHomebrew(){
  colorEcho ${BLUE} "check Homebrew exist or not"
  brew -v &>/dev/null
  if [[ $? -eq 0 ]]; then 
  colorEcho ${YELLOW} "HomeBrew existed"
  return 0 
  else
  colorEcho ${YELLOW} "Homebrew donot existed"
  return 2
  fi
  return 0 
}

downloadHomebrew(){
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [ $? != 0 ];then
  colorEcho ${RED} "Failed to download! Please check your network or try again."
  return 3
  fi
  return 0
}

checkV2ray(){
  colorEcho ${BLUE} "check v2ray exist or not"
  type v2ray &>/dev/null
  if [[ $? -eq 0 ]]; then 
  colorEcho ${YELLOW} "v2ray existed"
  return 0 
  else
  colorEcho ${YELLOW} "v2ray dont existed"
  return 2
  fi
  return 0 
}

downloadV2ray(){
  brew tap v2ray/v2ray && brew install v2ray-core
  if [[ $? -eq 0 ]];then
  return 0
  fi
  return 0
}

checkPrivoxy(){
  colorEcho ${BLUE} "check v2ray exist or not"
  tmp=$(brew list | grep privoxy)
  if [[ -n "$tmp" ]]; then 
  colorEcho ${YELLOW} "privoxy existed"
  return 0 
  else
  colorEcho ${YELLOW} "privoxy dont existed"
  return 2
  fi
  return 0 
}

downloadPrivoxy(){
  brew install privoxy 
  if [ $? != 0 ];then
  colorEcho ${RED} "Failed to download! Please check your network or try again."
  return 3
  fi
  return 0
}

checkShell(){
  colorEcho ${BLUE} "check shell type"
  shell=$(echo $SHELL | awk -F / '{print $NF}')
  if [[ "$shell" = "bash" ]];then
    colorEcho ${YELLOW} "You are using Bash"
    PROFILE=".profile"
    return 0
  elif [[ "$shell" = "zsh" ]];then
    colorEcho ${YELLOW} "You are using Zsh"
    PROFILE=".zshrc"
    return 1
  fi
}

checkProfile(){
  colorEcho ${BLUE} "check profile settings existed or not"
  if [[ -f ~/${PROFILE} ]];then
    colorEcho ${YELLOW} "profile ${PROFILE} file existed"
    return 0
  else
    colorEcho ${RED} "profile ${PROFILE} file dont exist, Creating"
    touch ~/${PROFILE}
  fi
  return 0
}

checkProfileConfig(){
  colorEcho ${BLUE} "check profile configuration"
  grep -q -F "proxy-settings-from-max" ~/${PROFILE}
  if [[ $? -eq 0 ]];then
  colorEcho ${YELLOW} "Profile settings already existed"
  return 1 
  else
    colorEcho ${RED} "Profile settings dont existed, creating"
  fi
  return 0
}

cpSetupScript(){
  cp $DIR/set-mac-http-proxy-settings.sh "$HOME/${CONFIG_DIR}/${shell}/"
  cp $DIR/restore-mac-proxy-settings.sh "$HOME/${CONFIG_DIR}/${shell}/"
  cp $DIR/set-mac-proxy-bypass-domain.sh "$HOME/${CONFIG_DIR}/${shell}/"
  cp $DIR/set-mac-proxy-settings.sh "$HOME/${CONFIG_DIR}/${shell}/"
  cp $DIR/set-mac-proxy-bypass-domain.sh "$HOME/${CONFIG_DIR}/${shell}/"
  cp $DIR/get-mac-proxy-settings.sh "$HOME/${CONFIG_DIR}/${shell}/"
  return 0
}

checkConfigDir(){
  colorEcho ${BLUE} "check config dir existed or not "
  if [[ -d "$HOME/${CONFIG_DIR}/${shell}" ]];then
  colorEcho ${YELLOW} "config dir $HOME/${CONFIG_DIR}/${shell} existed"
  return 0
  else
  colorEcho ${YELLOW} "config dir ${CONFIG_DIR}/${shell} dont exist, creating"
  mkdir -p "$HOME/${CONFIG_DIR}/${shell}"
  fi
  return 0

}

setProfile(){
  echo "
# proxy-settings-from-max
export http_proxy=\"http://127.0.0.1:8118\"
export https_proxy=\"http://127.0.0.1:8118\"
alias unsetttyproxy=\"unset http_proxy;unset https_proxy\"
alias setproxy=\"${shell} ~/${CONFIG_DIR}/${shell}/set-mac-proxy-settings.sh\"
alias getproxy=\"${shell} ~/${CONFIG_DIR}/${shell}/get-mac-proxy-settings.sh\"
alias sethttpproxy=\"${shell} ~/${CONFIG_DIR}/${shell}/set-mac-http-proxy-settings.sh\"
alias unsetproxy=\"${shell} ~/${CONFIG_DIR}/${shell}/restore-mac-proxy-settings.sh\"
alias setttyproxy=\"export http_proxy='http://127.0.0.1:8118';export https_proxy='http://127.0.0.1:8118'\"
alias getservices=\"${shell} ~/${CONFIG_DIR}/${shell}/get-mac-network-services.sh\"
alias testproxy=\"curl -s www.google.com | grep -o Google | uniq \"
" >> ~/${PROFILE}
  return 0
}

setupV2ray(){
  cp $DIR/v2ray.json /usr/local/etc/v2ray/config.json
  colorEcho ${BLUE} "restarting v2ray-core"
  brew services restart v2ray-core &>/dev/null
  colorEcho ${YELLOW} "v2ray-core restart done"
  return 0 
}

setupPrivoxy(){
  cp $DIR/privoxy.conf /usr/local/etc/privoxy/config
  colorEcho ${BLUE} "restarting privoxy"
  brew services restart privoxy &>/dev/null
  colorEcho ${YELLOW} "privoxy restart done"
  return 0
}

checkSudo(){
  colorEcho ${BLUE} "check networksetup permission"
  sudo grep -q -F 'NOPASSWD:/usr/sbin/networksetup' /etc/sudoers
  if [[ $? -eq 0 ]];then
  colorEcho ${YELLOW} "sudo settings already existed"
  return 1 
  fi
  return 0
}

setSudo(){
  colorEcho ${BLUE} "setting networksetup permission"
  echo "$(whoami)             ALL = (ALL) NOPASSWD:/usr/sbin/networksetup" | sudo tee -a /etc/sudoers 
  return 0
}

end(){
  colorEcho ${RED} "打开新的窗口, 然后在里面试试下面的命令"
}

help(){
  colorEcho ${BLUE} "命令行命令 setproxy 设置socks代理, 相当于图形界面全局代理"
  colorEcho ${BLUE} "命令行命令 unsetproxy 取消socks代理"
  colorEcho ${BLUE} "命令行命令 sethttpproxy 设置http代理, 相当于图形界面全局代理"
  colorEcho ${BLUE} "命令行命令 setttyproxy 设置命令行代理, 图形界面和命令行界面是两个世界, 这个命令相当于命令行的全局代理"
  colorEcho ${BLUE} "命令行命令 unsetttyproxy 取消命令行代理"
  colorEcho ${BLUE} "命令行命令 getproxy 参看当前代理设置情况"
  colorEcho ${BLUE} "命令行命令 getservices 查看当前正在使用的服务"
  colorEcho ${BLUE} "命令行命令 testproxy 测试命令,访问 Google"
  colorEcho ${YELLOW} "怎么没有自动代理的命令?"
  colorEcho ${BLUE} "v2ray 是自动判断 IP 的, 国外的网站才走代理的, 国内不走代理, v2ray 原理上就是自动代理了"
  colorEcho ${YELLOW} "如果还是有判断不合理的时候怎么办"
  colorEcho ${BLUE} "这种情况多发生在浏览国内的网站时, 我一般会执行 unsetproxy 关掉代理, 等操作结束在 setproxy 打开代理 "
  colorEcho ${YELLOW} "如果我忘记了这些命令怎么办"
  colorEcho ${BLUE} "这些命令实际上是 shell 的命令别名, 可以在 $HOME/${PROFILE} 文件的最后面找到"
}

while :
do
  checkHomebrew
  if [[ $? -eq 0 ]];then 
  break
  else
  downloadHomebrew
  fi
done 
checkV2ray
if [[ $? -eq 2 ]];then
  downloadV2ray
fi
checkPrivoxy
if [[ $? -eq 2 ]];then 
  downloadPrivoxy
fi
checkShell
checkProfile
checkProfileConfig
if [[ $? -eq 0 ]];then 
  setProfile
fi
checkConfigDir
cpSetupScript
setupV2ray
setupPrivoxy
checkSudo
if [[ $? -eq 0 ]];then
  setSudo
fi
end
help
