#!/bin/bash
# This is a simple utility to perform DNS and reverse DNS lookups from a remote server. 
# Usefull for making remote queries through VPN

# Optional hard-coded remote server hostname
remote_host="example.com"

function prompt_credentials {
    # Optionally read in remote host
    # read -p "Enter remote hostname: " remote_host
    read -p "Enter username: " remote_user
    read -s -p "Enter password: " remote_pass
    echo
}

function execute_on_remote {
    local cmd_string="$1"
    echo "$cmd_string" | sshpass -p "$remote_pass" ssh -q -o StrictHostKeyChecking=no "$remote_user@$remote_host"
}

function process_single_ip {
    local ip=$1
    execute_on_remote "nslookup $ip" | awk '/name = / {print $4}' | sed 's/\.$//' | grep -v -E '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n 1
}

function process_single_hostname {
    local hostname=$1
    execute_on_remote "nslookup $hostname" | awk '/Address: / {print $2}' | grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u
}

function process_ip_list {
    local list_file=$1
    local cmd_string=""
    while read -r ip; do
        cmd_string+="nslookup $ip;"
    done < "$list_file"
    execute_on_remote "$cmd_string" | awk '/name = / {print $4}' | sed 's/\.$//' | grep -v -E '([0-9]{1,3}\.){3}[0-9]{1,3}'
}

function process_hostname_list {
    local list_file=$1
    local cmd_string=""
    while read -r hostname; do
        cmd_string+="nslookup $hostname;"
    done < "$list_file"
    execute_on_remote "$cmd_string" | awk '/Address: / {print $2}' | grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort -u
}

prompt_credentials

case "$1" in
    -i)
        if [ -n "$2" ]; then
            process_single_ip "$2"
        else
            process_ip_list "ip.lst"
        fi
        ;;
    -h)
        if [ -n "$2" ]; then
            process_single_hostname "$2"
        else
            process_hostname_list "hostname.lst"
        fi
        ;;
    *)
        echo "Usage: $0 [-i | -h] [optional IP or hostname]"
        exit 1
        ;;
esac

# Clearing the password variable for security
unset remote_pass
