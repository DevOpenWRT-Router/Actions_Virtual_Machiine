# This script runs before SSH in Ubuntu instances

## Example ##

# Setting the time zone
#sudo timedatectl set-timezone "Asia/Shanghai"
sudo timedatectl set-timezone "America/New_York"

# Install the tools you need to use
sudo apt update
sudo apt upgrade
sudo apt install build-essential ccache ecj fastjar file g++ gawk \
gettext git java-propose-classpath libelf-dev libncurses5-dev \
libncursesw5-dev libssl-dev python python2.7-dev python3 unzip wget \
python3-distutils python3-setuptools rsync subversion swig time \
xsltproc zlib1g-dev

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
