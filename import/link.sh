#!/bin/bash
set -ux

# Slack API Token
# ref. <https://katblog.manadream.net/index.php/2022/07/23/mattermost-slack-data-import/#slack_API>
TOKEN=xoxb-++++++++++

# Email address linkage
./slack-advanced-exporter --input-archive ./slack_data.zip --output-archive export-with-emails.zip fetch-emails --api-token $TOKEN
./slack-advanced-exporter --input-archive export-with-emails.zip --output-archive export-with-emails-and-attachments.zip fetch-attachments
# Convert data from slack to mattermost
./mmetl transform slack --team home-carpentry --file export-with-emails-and-attachments.zip --output slack_export.jsonl
# compression
zip -r slack_export.zip data slack_export.jsonl
