sudo rm -rf /tmp/* ; sudo rm -rf ~/ubuntu-kvm; sudo rm -f ~/vmbuilder/images/ubuntu.vdi
rm ~/vmbuilder/ubuntu/interfaces
cp ~/vmbuilder/ubuntu/interfaces_bak ~/vmbuilder/ubuntu/interfaces
sed -i "s/ADDR/192.168.100.20/g" ~/vmbuilder/ubuntu/interfaces
sudo vmbuilder -v kvm ubuntu --rootsize=12288 -c ~/vmbuilder/ubuntu/template.cfg
# prepare disk image for virtualbox
qemu-img convert -O vdi `ls ubuntu-kvm/tmp*` ~/vmbuilder/images/ubuntu.vdi
sudo rm -rf ubuntu-kvm
