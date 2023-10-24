# Telegram_send_messages_and_files
### This script allows to send messages and files (attachments) to Telegram users.

---

Clone this repo: 
>git clone https://github.com/nextleveldevops/Telegram_send_messages_and_files.git \
or \
>git clone git@github.com:nextleveldevops/Telegram_send_messages_and_files.git

---

cd to cloned repo: 
>cd Telegram_send_messages_and_files

---
Telegram **API Token**: https://core.telegram.org/bots/features#botfather \
Insert your own Telegram API Token: 
>echo tg_api_token={your_token}
---
The recepient's **Chat Id**. Get it from bot: `@getidsbot` \
_Fill it - ONLY if you are going to send messages permanently to one specific user or chat (bot-informer etc), \
otherwise, don't fill it in the script and let the script ask the recipient's Chat Id each time._ 
>echo tg_user_chat_id={your_id}
---
This scripts requires the cURL to be installed! 

To install curl on Ubuntu (Debian, Mint etc):
>sudo apt update -y && sudo apt install -y curl

To install curl on Redhat (CentOS/Alma, Fedora etc):
>sudo dnf install -y curl or sudo yum install -y curl

To install curl on Arch (Manjaro, EndeavourOS):
>sudo pacman -Sy curl

To install curl on Alpine:
>sudo apk add curl

---
Make the script available from any place:
>sudo cp telegram-send-message.sh /usr/bin/ \
>sudo cp telegram-send-file.sh /usr/bin/

Usage in command-line: 
>telegram-send-message.sh 'message text' \
>telegram-send-file.sh absolute_path_to_file

Usage in any script: 
>/usr/bin/telegram-send-message.sh 'message text' \
>/usr/bin/telegram-send-file.sh absolute_path_to_file
