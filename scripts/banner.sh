#!/bin/bash
NAME=PiCLFS
DATE=2017-03-17
VERSION=1.0.0

LOGO1=' ________  ___  ________  ___       ________ ________      '
LOGO2='|\   __  \|\  \|\   ____\|\  \     |\  _____\\   ____\     '
LOGO3='\ \  \|\  \ \  \ \  \___|\ \  \    \ \  \__/\ \  \___|_    '
LOGO4=' \ \   ____\ \  \ \  \    \ \  \    \ \   __\\ \_____  \   '
LOGO5='  \ \  \___|\ \  \ \  \____\ \  \____\ \  \_| \|____|\  \  '
LOGO6='   \ \__\    \ \__\ \_______\ \_______\ \__\    ____\_\  \ '
LOGO7='    \|__|     \|__|\|_______|\|_______|\|__|   |\_________\'
LOGO8='                                               \|_________|'

TITLE1="\e[1m\e[92m${NAME} \e[93m${VERSION}  \e[37m[ ${DATE} ]"
TITLE2="Copyright 2017 KyuHyuk Lee"

BACKGROUND="\e[44m"
BOX="\e[40m\e[1m\e[37m"
RESET="\e[0m"

echo -e "${BACKGROUND}\t\t\t\t\t\t\t\t\t\t ${RESET}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO1}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO2}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO3}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO4}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO5}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO6}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t\t ${RESET}\n" "${LOGO7}"
printf "${BACKGROUND}\t \e[1m\e[97m%s\t${VERSION}\t ${RESET}\n" "${LOGO8}"
echo -e "${BACKGROUND}\t\t\t\t\t\t\t\t\t\t ${RESET}"
echo -e "${BACKGROUND}\t\t\t\t\t\t\t\t\t\t ${RESET}"
echo -e "${BACKGROUND}   ${BOX}                                ${BACKGROUND}    ${BOX}                                      ${BACKGROUND}   ${RESET}"
echo -e "${BACKGROUND}   ${BOX}  ${TITLE1}  ${BACKGROUND}    ${BOX}          \e[92m[ Repository URL ]          ${BACKGROUND}   ${RESET}"
echo -e "${BACKGROUND}   ${BOX}                                ${BACKGROUND}    ${BOX}                                      ${BACKGROUND}   ${RESET}"
echo -e "${BACKGROUND}   ${BOX}   ${TITLE2}   ${BACKGROUND}    ${BOX} https://github.com/LeeKyuHyuk/PiCLFS ${BACKGROUND}   ${RESET}"
echo -e "${BACKGROUND}   ${BOX}                                ${BACKGROUND}    ${BOX}                                      ${BACKGROUND}   ${RESET}"
echo -e "${BACKGROUND}\t\t\t\t\t\t\t\t\t\t ${RESET}"
echo -e "${BACKGROUND}\t\t\t\t\t\t\t\t\t\t ${RESET}"
