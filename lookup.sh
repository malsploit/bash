#!/bin/bash
# Bulk DNS Lookup
# Generates a CSV of DNS lookups from a list of domains.
#
# File name/path of domain list:
domain_list=$1 # One FQDN per line in file.

# Seconds to wait between lookups:
loop_wait='0.2' # Is set to 0.2 second.

echo 'Domain name, IP Address' # Start CSV
for domain in $(cat $domain_list) # Start looping through domains
do
    # IP address of the nameserver used for lookups:
    ns_ip=$(shuf -n1 -e 1.1.1.1 8.8.8.8 8.8.4.4 1.0.0.1 208.67.222.222 208.67.220.220) # Randomly select DNS server
    ip=$(dig @$ns_ip +short $domain | tail -n1) # IP address lookup
    if [ -z "$ip" ] # If the IP is null (expired or invalid domain)
        then # Then
            echo "$domain,No DNS" # Write "No DNS" in the IP column
    fi
    sleep $loop_wait # Pause before the next lookup to avoid flooding NS
done
