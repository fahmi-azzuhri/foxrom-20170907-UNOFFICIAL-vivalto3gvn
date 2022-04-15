#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7081984 4751988369c1b895f56164429dfd0837c7131279 4855808 49bcc0ddde6b910bd19262742a4b8d99672b8bef
fi

if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:7081984:4751988369c1b895f56164429dfd0837c7131279; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:4855808:49bcc0ddde6b910bd19262742a4b8d99672b8bef EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY 4751988369c1b895f56164429dfd0837c7131279 7081984 49bcc0ddde6b910bd19262742a4b8d99672b8bef:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
