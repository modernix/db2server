#!/bin/bash

#install required files 
#yum install libaio.so.1 libpam.so.0 -y
yum install libaio numactl libpam.so.0 -y

#disable ASLR -
echo "kernel.randomize_va_space=0" >> /etc/sysctl.conf
sysctl -p

#install db2
cd /vagrant
#tar -zxvf v9.7fp9_linuxx64_server.tar.gz --owner root --group root --no-same-owner 2>&1 > tar2.log
tar -zxvf v9.7fp9_linuxx64_server.tar.gz --owner root --group root --no-same-owner
/vagrant/server/db2setup -r /vagrant/db2ese.rsp

#registering the DB2's license
#/opt/ibm/v9.7/bin/db2licm -a /vagrant/db2.lic
