#!/bin/bash

################################################################################################
# database-list

function database-list() {
    # help
    if [ "$1" == "help" ];
    then
        database-list-help
    elif [ -z "$1" ];
    then
    az sql server list --query "[].{Name:name}" --output table
    fi

}


function test() {
subscriptions=( $(az account list --query "[].{Name:name}" --output tsv) )
declare -p subscriptions


}


# search
: <<'END_COMMENT'
function search() {

    # parameters
    read -p "Enter search term: " search

    # set variable
    subscriptions=( bcp testing dev preprod prod )
    
    # list instances
    for env in "${envs[@]}"
        do
	    az account set --subscription $subscriptions
        echo "Searching $env..."

        az sql db list --resource-group MyResourceGroup --server myserver
        gcloud sql instances list | tail -n +2 | while read -r name database_version location tier primary_address private_address csstatus; do
    
    #create an array of instance names
        instances+=($name)

    # list databases
        db=$(gcloud sql databases list --instance $name | grep $search | cut -d " " -f1)
        if [ -n "$db" ]; then
            echo "Environment: $env - Database: [ $db ] found in Instance: [ $name ]"
        fi
    done
done
fi
}




#for 
#az sql db list

#$STORAGE_CONTAINERS=(books magazines literature)
#for container in $STORAGE_CONTAINERS; do
    #az storage container create --name $container 
        #--account-name $STORAGE_ACCOUNT_NAME
#done

#Sqlcmd -S lrtdev-databases-dev.database.windows.net -d Clearing -U 55138929@ad.mmu.ac.uk -P *** -G

#az sql db list --resource-group MyResourceGroup --server myserver


END_COMMENT
"$@"