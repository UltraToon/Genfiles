## Installation ##

- Right when you chroot, emerge `gentoo-kernel-bin` **IMMEDIATELY** and run `emerge --sync`.
- **IMPORT** your make.conf.

- **(IMPORTANT)** Do `# emerge -e @world` to re-emerge every package compiled so far, and add GCC optimizations that **YOU** added if available.

- Apply a **DESKTOP** profile.

- Run `emerge -uqDN @world` to **UPDATE** your packages.

## Post Install ##

- Setup a compressed **ZRAM** block device with the **ZSTD** algorithm.
- Setup portage **TMPFS** with at most 10G.
- Setup a weekly cronjob to **FSTRIM** the disk device.

### Setup GIT-SYNC for faster sync time ###

- **(REQUIRED)** Install git and eselect-repository: `# emerge -a git eselect-repository`
- Run `# eselect repository remove gentoo` to remove the old repo
- Create the following file:

```
/etc/portage/repos.conf/gentoo.conf
-----------------------------------
[DEFAULT]
main-repo = gentoo

[gentoo]
location = /var/db/repos/gentoo
sync-type = git
sync-uri = https://github.com/gentoo-mirror/gentoo.git
auto-sync = yes
sync-depth = 1
sync-git-verify-commit-signature = yes
sync-openpgp-key-path = /usr/share/openpgp-keys/gentoo-release.asc
```

- Then make the switch: \
`# emerge --sync`
