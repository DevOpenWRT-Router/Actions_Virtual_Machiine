# This script runs after SSH in Ubuntu instances
git clone https://github.com/openwrt/openwrt.git
cd openwrt
wget https://downloads.openwrt.org/snapshots/targets/mvebu/cortexa9/feeds.buildinfo  -O feeds.conf.default
wget https://downloads.openwrt.org/snapshots/targets/mvebu/cortexa9/config.buildinfo -O .config
git clone git@github.com:jerrykuku/luci-theme-argon.git package/luci-theme-argon
printf 'CONFIG_TARGET_mvebu=y\nCONFIG_TARGET_mvebu_cortexa9=y\n' >> .config
printf 'CONFIG_SIGNED_PACKAGES=y\n' >> .config
printf 'CONFIG_TARGET_mvebu_cortexa9_DEVICE_linksys_wrt3200acm=y\n' >> .config
printf 'CONFIG_BUILD_LOG=y\n' >> .config
grep -sq CONFIG_TARGET_mvebu=y .config
sed -ne '/^CONFIG_LIBC=/ { s!^CONFIG_LIBC="\(.*\)"!\1!; s!^musl$!!; s!.\+!-&!p }' .config
