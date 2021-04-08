#!/bin/sh
# Pushes dvc objects to a surfdrive folder set as a dvc local remote

read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

R_SURF=$(read_var REMOTE_SURF .env)

# Set surfdrive as the default remote
dvc remote add -d surfdrive ${R_SURF}

echo $R_SURF

# push to surf remote
dvc push

# remove the remote
dvc remote remove surfdrive