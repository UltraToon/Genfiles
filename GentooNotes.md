Setup a compressed **ZRAM** block device with the **ZSTD** algorithm. \
Setup portage **TMPFS** with at most 10G. \
Setup a weekly cronjob to **FSTRIM** the disk device. \


Setup **GIT-SYNC** by creating the following file:

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

Then make the switch: \
`emerge -a git` \
`rm -rf /var/db/repos/gentoo/*` \
`emerge --sync`
