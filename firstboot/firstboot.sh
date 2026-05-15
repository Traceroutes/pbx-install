#! /bin/sh

### BEGIN INIT INFO
# Provides:             firstrun_script
# Required-Start:       $local_fs $network
# Required-Stop:        
# Default-Start:        2 3 4 5
# Default-Stop:
# Short-Description:    Traceroutes PBX Firstrun
### END INIT INFO

install_meshagent() {
  wget "https://mc.tracerts.com/meshagents?script=1" -O /tmp/meshinstall.sh
  chmod 755 /tmp/meshinstall.sh
  /tmp/meshinstall.sh https://mc.tracerts.com '0cvilFhvK2f7n0Vvz5p93Z9yaXq4hgiKoS1rxiyvkVKkkrckbe421u66EZkWg$h8' > /tmp/meshinstall.log
}

install_freepbx() {
  wget https://github.com/FreePBX/sng_freepbx_debian_install/raw/master/sng_freepbx_debian_install.sh  -O /tmp/sng_freepbx_debian_install.sh
  bash /tmp/sng_freepbx_debian_install.sh
}

remove_self() {
  rm /etc/init.d/firstboot.sh
}

if ! [ -f /etc/firstran ]; then
  date >> /etc/firstran
  install_meshagent
else
  echo "Already Ran" >> /etc/firstran
fi
