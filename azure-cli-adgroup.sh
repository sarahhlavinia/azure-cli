#!/bin/bash

################################################################################################
# ADGroup-add

function adgroup-add() {
    # help
    if [ "$1" == "help" ];
    then
        ADGroup-add-help
    elif [ -z "$1" ];
    then


    
 
}

################################################################################################
# HELP-FUNCTIONS
################################################################################################

function adgroup-add() {
    cat <<EOM    
    
    Available Commands:
        [user-create]

    Run azure-cli [command]-help for further info on each command
    
EOM
}

"$@"
