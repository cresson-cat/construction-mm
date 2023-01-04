# construction-mm

Script for building GCP mattermost, porting slack data for mattermost  
Assume the following template

[Mattermost Team Edition packaged by Bitnami](https://console.cloud.google.com/marketplace/product/bitnami-launchpad/mattermost)

## How to use

1. SSL-enabled
   1. [Reference URL](https://www.karelie.net/mattermost-gce-ssl/#gcevmlets_encrypt_ssl_certificatessl)
      1. Refer to the above and introduce lego
      1. Execute `./enc/lets-enc.sh`
1. Convert slack data to mattermost
   1. [Reference URL](https://katblog.manadream.net/index.php/2022/07/23/mattermost-slack-data-import/#i-2)
      1. Using the above URL as a reference, store the following in `./import/`
         - mmetl
         - slack-advanced-exporter
      1. Follow the instructions in the URL above to download the slack data and store it under `./import/`. Name the file `slack_data.zip`
      1. Modify the variables for the slack API token at the top of `link.sh` to match the current situation
      1. Execute `./import/link.sh`
1. Data Registration
   1. [Reference URL](https://katblog.manadream.net/index.php/2022/07/23/mattermost-slack-data-import/#Mattermost-2)
      1. Register data according to the URL above

## Other Reference URLs

<https://note.com/arkb/n/nedecd6c170f5>
