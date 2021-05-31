dnf install epel-release -y

dnf install snapd
systemctl enable --now snapd.socket
sleep 10 
ln -s /var/lib/snapd/snap /snap
sleep 10 

snap install shadowsocks-libev

cp ./config.json /snap/bin/config.json
cp ./ss.service /lib/systemd/system/ss.service

systemctl start ss.service
systemctl stop firewalld
systemctl enable ss.service
systemctl status ss.service
