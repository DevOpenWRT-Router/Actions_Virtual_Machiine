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
