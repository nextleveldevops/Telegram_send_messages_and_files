# Telegram_send_messages_and_files
### This script allows to send messages and files (attachments) to Telegram users.

---

Clone this repo: 
>git clone git@github.com:DevOps-autokz/Telegram_send_messages_and_files.git

---

cd to cloned repo and add your own .env file: 
>cd Telegram_send_messages_and_files \
>touch .env

---

Telegram **API Token**: https://core.telegram.org/bots/features#botfather \
Insert your own Telegram API Token to .env file: 
>echo tg_api_token={your_token} >> .env

---

The recepient's **Chat Id**. Get it from bot: `@getidsbot` \
_Insert it in .env file - ONLY if you are going to send messages permanently to one specific user or chat (bot-informer etc), \
otherwise, don't insert it to .env and let the script ask the recipient's Chat Id each time._ 
>echo tg_user_chat_id={your_id} >> .env 

---
To install curl on Ubuntu (Debian, Mint etc):
sudo apt update -y && sudo apt install -y curl

To install curl on Redhat (CentOS/Alma, Fedora etc):
sudo dnf install -y curl or sudo yum install -y curl

To install curl on Arch (Manjaro, EndeavourOS): 
sudo pacman -Sy curl

To install curl on Alpine: 
sudo apk add curl


Usage: 
>./telegram-send-message.sh 'message text' \
>./telegram-send-file.sh path_to_file
