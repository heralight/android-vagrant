#!/bin/bash

SCRIPTDIR=`dirname "$BASH_SOURCE"`
BASE_DIR=$(pwd)
ARCHIVE_DIR=$BASE_DIR/archive
VAGRANT_DIR=$BASE_DIR/.vagrant/machines/default/virtualbox

# Import the VirtualBox machine
echo "Importing VirtualBox VM"
VBoxManage import $ARCHIVE_DIR/virtualbox.ovf

# Import the Vagrant box
echo "Importing Vagrant Box"
vagrant box add $ARCHIVE_DIR/package.box \
    --force \
    --name "ubuntu/trusty32"

# Import the .vagrant files
echo "Importing .vagrant files"
mkdir -p $VAGRANT_DIR
cp $ARCHIVE_DIR/action_set_name $VAGRANT_DIR
cp $ARCHIVE_DIR/private_key $VAGRANT_DIR

# Get the VM ID (call get_vm_id.sh)
VM_ID=$(sh $SCRIPTDIR/get_vm_id.sh $ARCHIVE_DIR/action_set_name)

# Create the correct ID file (with the VM ID)
echo "Creating .vagrant/.../id and .vagrant/.../action_provision"
echo $VM_ID > $VAGRANT_DIR/id
echo "1.5:$VM_ID" > $VAGRANT_DIR/action_provision
