#!/usr/bin/env sh
#title           :telegram-send-message.sh
#description     :This script will send text-message to Telegram.
#author	      	 :nextleveldevops (nextleveldevops@gmail.com)
#date            :08-12-2022
#version         :1.0    
#usage		       :./telegram-send-message.sh
#notes           :Install curl to use this script.
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

# The message could be passed as argument ($@).
# If not, request user to type the message:
message="$@"
[ -z "$message" ] && \
	read -p "PLEASE, TYPE YOUR MESSAGE: " "message"

# Send the message via Telegram API:
curl -s \
        -X POST \
        https://api.telegram.org/bot${tg_api_token}/sendMessage \
        -d text="${message}" \
        -d chat_id=${tg_user_chat_id} 1>/dev/null
