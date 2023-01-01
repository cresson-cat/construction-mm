# construction-mm

GCP mattermost の構築用のスクリプト。slack のデータを mattermost 用に移植する  
以下のテンプレートを前提とする

[Mattermost Team Edition packaged by Bitnami](https://console.cloud.google.com/marketplace/product/bitnami-launchpad/mattermost)

## 使い方

1. SSL 化する
   1. [SSL化参考](https://www.karelie.net/mattermost-gce-ssl/#gcevmlets_encrypt_ssl_certificatessl) を参考に進める（lego の導入等）
   1. `./enc/lets-enc.sh` を実行する
1. slack のデータを mattermost 用に変換する
   1. [slackデータの変換](https://katblog.manadream.net/index.php/2022/07/23/mattermost-slack-data-import/) を参考に進める
   1. 上記URLを参考とする。`mmetl` `slack-advanced-exporter` をダウンロードし、`./import/` 配下に格納する
   1. 上記URLの手順に従い、slack のデータをダウンロードし、`./import/` 配下に格納する。ファイル名は `slack_data.zip` とする
   1. `link.sh` の上部にある、slack API のトークン用変数を、現状に合わせて修正する
   1. `./import/link.sh` を実行する

## 全体の参考

<https://note.com/arkb/n/nedecd6c170f5>
