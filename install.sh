#!/bin/bash

# functions

function upgrade() {
	cat << EOM

	You already have a version of the Azure cli installed.

	Upgrading your version of Azure CLI to the latest stable version.

	EOM
}

function install() {
cat << EOM

You don't have a version of the Azure cli installed.

Installing the latest stable version.

EOM
}

# variables

file="/C/Users/55138929/azure-cli"
aliaschk=$(alias | grep azure-cli=)

function copyfiles() {
	curl -LJO https://git.mmu.ac.uk/cmd/azure-cli/raw/master/azure-cli
	chmod +x /C/Users/55138929/azure-cli
	sleep 1
	}

	# install
	

	if [ -f "$file" ]
	then
		read -p "MMU ID:" mmuid
		upgrade
		sleep 1
		echo "$(tput bold)Upgrading Azure CLI..."
		cd /C/Users/$mmuid/azure-cli
		copyfiles
		echo "$(tput setaf 2)Completed!"
	else
		read -p "MMU ID:" mmuid
		install
		sleep 1
		echo "$(tput bold)Installing Azure CLI..."
		cd /C/Users/$mmuid/azure-cli
		copyfiles
		echo "$(tput setaf 2)Completed!"
	fi	
