#!/bin/bash

# Help message
help() {
    echo 'Usage:'
    echo 'bash setup.sh [-h] -u "username"'
}

# Parse inputs
while getopts "h?:u:" flag
do
    case "${flag}" in
        h)  help
            exit 0;;
        u)  username=${OPTARG};;
        \?) help
            exit 1
            ;;
    esac
done

if [ -z "$username" ] ; then
    echo "Username cannot be empty"
    echo ''
    help
    exit 1
fi

echo "Username: $username"
