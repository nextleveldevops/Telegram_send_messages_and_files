#!/usr/bin/env sh
#title           :telegram-send-file.sh
#description     :This script will send file attachment to Telegram.
#author		       :nextleveldevops (nextleveldevops@gmail.com)
#date            :08-12-2022
#version         :1.0    
#usage		       :./telegram-send-file.sh
#notes           :Install curl to use this script. Send just one file atime
#==============================================================================

set -o errexit

# Telegram API Token should be provided
# More info about API Token is here: https://core.telegram.org/bots/features#botfather
tg_api_token=""
[ -z "$tg_api_token" ] && \
	{ echo -e "\e[91mPlease, fill Telegram API Token (tg_api_token="", at line: $(($LINENO-2))) and start over\e[0m" ; exit 1 ; }

# The recepient's chat id. Get it from bot: @getidsbot
# Fill it to send messages to specific user or chat,
# or leave empty to request it on each run (in case, if you send message to different users).
tg_user_chat_id=""
[ -z "$tg_user_chat_id" ] && \
	read -p "PLEASE, TYPE THE RECEPIENTS CHAT_ID... (you can get it from @getidsbot bot): " "tg_user_chat_id"

# Check if curl is installed:
[ -x "$(command -v curl)" ] || \
	{ echo -e "\e[91mPlease, install cURL and start over\e[0m" ; exit 1 ; }

# The file-path could be passed as argument ($1).
# If not, request user to type the file-path:
attachment="$1"
[ -z "$attachment" ] && \
	read -p "PLEASE, TYPE THE FULL PATH TO THE FILE ( '~' is not accepted): " "attachment"

### Send file (attachment) via Telegram API:
curl -s \
	-m 20 -F "chat_id=${tg_user_chat_id}" \
	-F document=@"${attachment}" \
	https://api.telegram.org/bot${tg_api_token}/sendDocument 1>/dev/null
