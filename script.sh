#!/bin/bash

# Check if the correct number of arguments are passed
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input file> <domain file or single domain>"
  exit 1
fi

input_file=$1
domain_file_or_domain=$2

# Function to extract URLs starting with http or https related to a domain
extract_urls() {
  domain=$1
  output_file="${domain}.txt"

  # Use grep to find URLs related to the domain and sed to remove trailing ]
  grep -Eo "(https?://$domain[^ ]*)" "$input_file" | sed 's/\]$//' > "$output_file"

  # Check if the output file has content
  if [[ -s $output_file ]]; then
    echo "URLs for $domain saved to $output_file"
  else
    echo "No URLs found for $domain"
    rm -f "$output_file"
  fi
}

# If a file of domains is provided
if [[ -f "$domain_file_or_domain" ]]; then
  while IFS= read -r domain; do
    extract_urls "$domain"
  done < "$domain_file_or_domain"
else
  # If a single domain is provided
  extract_urls "$domain_file_or_domain"
fi
