[![Board Status](https://dev.azure.com/jackyao713911/1aefc37e-fcb0-4ee1-ace2-dc62de3257de/574ef8e2-2468-42d3-8ee4-52fc0739346e/_apis/work/boardbadge/3999b310-d315-40f5-822a-cd5c34495e90)](https://dev.azure.com/jackyao713911/1aefc37e-fcb0-4ee1-ace2-dc62de3257de/_boards/board/t/574ef8e2-2468-42d3-8ee4-52fc0739346e/Microsoft.RequirementCategory)
# LinuxAutoShell

# git config

git config --global user.email "jackyao713911@gmail.com"  



git config --global user.name "jyao"

## docker TZ config 

`-e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro`


## Linux 问题解决

### /usr/lib/rpm/redhat/redhat-hardened-cc1: No such file or directory

```
sudo dnf install redhat-rpm-config
```
