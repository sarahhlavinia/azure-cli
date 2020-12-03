#!/bin/bash

################################################################################################
# subscription-list

function subscription-list() {
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az account list --all
}

################################################################################################
# subscription-set

function subscription-set {

    # show current subscription set
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv
    echo -e "\e[0m"
    # parameters
    read -p "Set Subscription to: " subscription
    az account set --subscription $subscription
}


"$@"