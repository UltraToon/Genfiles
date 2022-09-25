Setup ZRAM compressed block device \
Setup portage TMPFS \
Setup weekly FSTRIM job with cronjob \


**Enable Git-Sync**
Create the following file:

```
/etc/portage/repos.conf/gentoo.conf 

[DEFAULT]
main-repo = gentoo

[gentoo]
location = /var/db/repos/gentoo
sync-type = git
sync-uri = https://github.com/gentoo-mirror/gentoo.git
auto-sync = yes
sync-git-verify-commit-signature = yes
sync-openpgp-key-path = /usr/share/openpgp-keys/gentoo-release.asc
```

To make the switch: \
`emerge -a git` \
`rm -rf /var/db/repos/gentoo/*` \
`emerge --sync`
