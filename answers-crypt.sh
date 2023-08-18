#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <encrypt|decrypt> <folder_name> <passphrase>"
    exit 1
fi

operation=$1
folder_name=$2
passphrase=$3

if [ "$operation" == "encrypt" ]; then
    tar czf - "$folder_name" | openssl enc -aes-256-cbc -salt -k "$passphrase" -out answers-encrypted.tar.gz.enc
    echo "Folder encrypted and saved as 'answers-encrypted.tar.gz.enc'"
elif [ "$operation" == "decrypt" ]; then
    openssl enc -aes-256-cbc -d -salt -k "$passphrase" -in "$folder_name" -out decrypted.tar.gz
    tar xzf decrypted.tar.gz
    rm decrypted.tar.gz
    echo "Folder decrypted and extracted"
else
    echo "Invalid operation. Use 'encrypt' or 'decrypt'."
    exit 1
fi
