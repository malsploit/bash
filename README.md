# Bulk DNS Lookup Script

This script is designed to conduct a bulk DNS lookup for a list of domains and outputs the results in a CSV format. It is particularly useful for users who need to check the registration status of a large number of domains. The script was created with efficiency in mind and is designed to be simple to use and easy to modify based on your specific needs.

## Functionality

The script reads a list of Fully Qualified Domain Names (FQDNs) from a text file. For each domain, it performs a DNS lookup using the `dig` command in Linux. The script uses a set of common DNS servers for the lookups, chosen randomly for each request to distribute the load and avoid rate limits. 

If a domain doesn't have an associated IP address (indicating that it is likely not registered), the script will output "No DNS" for that domain in the CSV file.

## Usage

To use the script, simply run it from the command line and pass the file containing the list of domains as the first argument, like so: `./script.sh domains.txt`. The domains in the input file should be one per line.

The script will output the results directly to the console in a CSV format. You may want to redirect the output to a file for further analysis or processing, e.g., `./script.sh domains.txt > results.csv`.

Please note that the script introduces a short delay between each lookup to prevent flooding the DNS servers with too many requests at once.

## Requirements

This script requires a Unix-like operating system with the `dig` command available, which is commonly included in most Linux distributions. The input should be a text file with one domain per line.

## Contribution

Feel free to contribute to this script by making a pull request. If you encounter any issues or have any suggestions for improvements, please open an issue on this GitHub repository.
