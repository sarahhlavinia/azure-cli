#!/bin/bash

################################################################################################
# resource-list

function resource-list() {
    # help
    if [ "$1" == "help" ];
    then
        resource-list-help
    elif [ -z "$1" ];
    then

    az resource list --query "[].{Name:name,Location:location,ResourceGroup:resourceGroup}" --output table | column -t -s '|'
    fi

}



"$@"