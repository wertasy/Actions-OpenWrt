#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
git clone https://github.com/coolsnowwolf/lede tmp/coolsnowwolf/lede
ln -sf $PWD/tmp/coolsnowwolf/lede/target/linux/generic/hack-5.15/992-add-ndo-do-ioctl.patch target/linux/generic/hack-5.15
ln -sf $PWD/tmp/coolsnowwolf/lede/target/linux/generic/hack-5.15/953-net-patch-linux-kernel-to-support-shortcut-fe.patch target/linux/generic/hack-5.15
ln -sf $PWD/tmp/coolsnowwolf/lede/target/linux/generic/hack-5.15/982-add-bcm-fullconenat-support.patch target/linux/generic/hack-5.15
ln -sf $PWD/tmp/coolsnowwolf/lede/target/linux/generic/hack-5.15/992-add-ndo-do-ioctl.patch target/linux/generic/hack-5.15

echo "src-link coolsnowwolf_lede $PWD/tmp/coolsnowwolf/lede/package/lean" >> feeds.conf.default
echo 'src-git coolsnowwolf_packages https://github.com/coolsnowwolf/packages' >> feeds.conf.default
echo 'src-git coolsnowwolf_luci https://github.com/coolsnowwolf/luci' >> feeds.conf.default
echo 'src-git coolsnowwolf_routing https://github.com/coolsnowwolf/routing' >> feeds.conf.default
