#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

#打Path
#fullconenat-fw3-patch
mkdir -p package/network/config/firewall/patches
wget -O package/network/config/firewall/patches/fullconenat.patch https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/fullconenat.patch
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/Makefile.patch | patch -p1
pushd feeds/luci
wget -O- https://github.com/LGA1150/fullconenat-fw3-patch/raw/master/luci.patch | patch -p1
popd
