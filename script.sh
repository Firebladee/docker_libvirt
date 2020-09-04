#!/bin/bash

printf "\nInstall libvirt\n"
printf "This will take a while\n"
yum -y -q install deltarpm
yum -y -q update
yum -y -q install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install

printf "\nStart libvirtd\n"
systemctl enable libvirtd
systemctl start libvirtd

export LIBGUESTFS_BACKEND=direct

printf "\nConverting vm to tar file\n"
virt-tar-out -a CentOS-7-x86_64-GenericCloud-1711.qcow2  / - | gzip --best > centos7.tgz

# TODO: Variablize this script
