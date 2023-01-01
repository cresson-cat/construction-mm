#!/bin/bash
set -ux

TOKEN=xoxb-++++++++++

# メールアドレス紐付け（末尾のトークンを更新）
./slack-advanced-exporter --input-archive ./slack_data.zip --output-archive export-with-emails.zip fetch-emails --api-token $TOKEN
./slack-advanced-exporter --input-archive export-with-emails.zip --output-archive export-with-emails-and-attachments.zip fetch-attachments
# mm 用にファイル変換
./mmetl transform slack --team home-carpentry --file export-with-emails-and-attachments.zip --output slack_export.jsonl
# 圧縮
zip -r slack_export.zip data slack_export.jsonl
