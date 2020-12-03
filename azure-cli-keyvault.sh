#!/bin/bash

################################################################################################
# keyvault-list

function keyvault-list() {
    az keyvault list
}

function keyvault-secret-list() {
    read -p "KeyVault: " vaultname
    az keyvault secret list --vault-name $vaultname
}

function keyvault-secret-show {
    read -p "KeyVault: " vaultname
    read -p "Secret: " secret
    az keyvault secret show --name $secret --vault-name $vaultname
}

"$@"