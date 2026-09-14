#!/bin/bash

# Kiểm tra nếu hệ điều hành chứa chữ "linux"
if [[ "$OSTYPE" == "linux"* ]]; then
    DATETIME=$(date +'%Y-%m-%d %H:%M:%S')
else
    # Mặc định cho Windows (chạy qua Git Bash hoặc môi trường Windows khác)
    DATETIME="$(date +'%Y-%m-%d %H:%M:%S')"
fi

git add .
git commit -m "Auto backup: $DATETIME"
git push
