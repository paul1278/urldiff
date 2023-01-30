# UrlDiff
A very small script which compares the state of URLS based on `md5`. If the state changes, you can run an action - whatever you like basically.

## Install requirements
* bash
* diff
* md5sum
* sed

## Setup
Place the files inside a folder.
Edit `pages` according to your needs, each line represents a page.

```bash
page-url|regex
```
The `page-url` is simply the url. The `regex` is passed to `sed` to replace some things on the website before calculating the checksum - like a date-tag or something.
### Cronjob
Add a cronjob to your system to run `main.sh` based on an interval.
