#!/urs/bin/env python

from os import system
from os import popen

user = popen("echo $USER@$(uname -n)").read().strip("\n")
kernel = popen("echo $(uname -msr)").read().strip("\n")
uptime = popen("echo $(uptime -p | awk '{print $2,$3,$4,$5}')").read().strip("\n")
pacotes = popen("echo $(pacman -Qq | wc -l)").read().strip("\n")
shell = popen("echo $SHELL").read().strip("\n")
cpu = popen("echo $(cat /proc/cpuinfo | sed -n '5p' | awk '{print $4, $5, $6, $7, $8, $9}')").read().strip("\n")
mem = popen("echo $(free --mebi | sed -n '2p' | awk '{print $3}')MiB / $(free --mebi | sed -n '2p' | awk '{print $2}')MiB").read().strip("\n")

system("clear")
print("")
print("\033[1;33m   ▄███████▄     ", end="")
print("\033[01;36m%s"% user)
print("\033[1;33m ▄█████████▀▀    ", end="")
print("\033[00m------------")
print("\033[1;33m ███████▀        ", end="")
print("\033[01;36mOS\033[00m: Arch Linux")
print("\033[1;33m ███████▄        ", end="")
print("\033[01;36mKernel\033[00m: %s"% kernel)
print("\033[1;33m ▀█████████▄▄    ", end="")
print("\033[01;36mWM\033[00m: Hyprland")
print("\033[1;33m   ▀███████▀     ", end="")
print("\033[01;36mUptime\033[00m: %s"% uptime)
print("")
print("\033[1;32m   ▄██████▄")
print("\033[1;32m ▄\033[1;37m█▀█\033[1;32m██\033[1;37m█▀█\033[1;32m██▄    \033[01;36mPacotes\033[00m: %s"% pacotes)
print("\033[1;32m █\033[1;37m▄▄█\033[1;32m██\033[1;37m▄▄█\033[1;32m███    \033[01;36mShell\033[00m: %s"% shell)
print("\033[1;32m ████████████    \033[01;36mCpu\033[00m: %s"% cpu)
print("\033[1;32m ██▀██▀▀██▀██    \033[01;36mMem\033[00m: %s"% mem)
print("\033[1;32m ▀   ▀  ▀   ▀")
print("\033[01;31m                  ███\033[01;32m███\033[01;33m███\033[01;34m███\033[01;35m███\033[01;36m███")
#print("\033[0;32m                   (C) Copyrights, @UsuarioIndisponivel (January 08, 2017) 'Script Python', Retrieved January 08, 2017.")
