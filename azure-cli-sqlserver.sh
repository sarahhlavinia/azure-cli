#!/bin/bash

################################################################################################
# sqlserver-list

function sqlserver-list() {
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list
}

################################################################################################
# sqlserver-list

function sqlserver-create-date() {

#sqlServers = $(az sql server list --output json)
sqlServers=$(az sql server list --query "[].{Name:name,Resourcegroup:resourceGroup}" --output json)
echo $sqlServers
for sqlServer in $sqlServers;
do
databases=$(az sql db list --resource-group $sqlServers.ResourceGroup --server $sqlServers.Name --output json)
done
}

az sql db list --resource-group RG-LRT-LIVE-WEBAPP --server lrtlive-databases --query "[].{DatabaseName:name,CreatedDate:creationDate}" --output json

################################################################################################
# sqlserver-list-all

function sqlserver-list-all() {

    az account set --subscription LRT-DEV
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list

    az account set --subscription 'Shared Hub Dev'
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list

    az account set --subscription 'API Gateway Dev Test'
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list

    az account set --subscription LRT-LIVE
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list

    az account set --subscription 'API Gateway Production'
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list

    az account set --subscription 'ISDS Infrastructure Production Services'
    echo -e "\e[91mCurrent Subscription set: "
    az account show --query 'name' --out tsv 
    echo -e "\e[0m"
    az sql server list


}


"$@"