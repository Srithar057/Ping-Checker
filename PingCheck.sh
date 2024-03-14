#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
RESET='\033[0m'
blue='\033[1;34m'
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi

total_ips=$(cat "$1" | wc -l)

# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
count_progress() {
    completed_ips=$1
    progress="${completed_ips}/${total_ips}"
    printf "Progress: %-10s\r" "${progress}"
}
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi

successful_ips=()
failed_ips=()

# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
ping_check() {
    completed_ips=0
    echo "--------------------"
    while IFS= read -r ip; do
        if ping -c 1 "$ip" &> /dev/null; then
            successful_ips+=("$ip")
        else
            failed_ips+=("$ip")
        fi
      
        ((completed_ips++))
   
        count_progress "$completed_ips"
    done < "$1"
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
    echo ""
    echo "--------------------"
    echo "Successful IPs:"
    for ip in "${successful_ips[@]}"; do
        echo -e "${GREEN}$ip${RESET}"
    done

    echo ""
    echo "Failed IPs:"
    for ip in "${failed_ips[@]}"; do
        echo -e "${RED}$ip${RESET}"
    done

    echo "--------------------"
    echo "Results Count:"
    echo -e "${GREEN}Success : ${#successful_ips[@]}/$total_ips${RESET}"
    echo -e "${RED}Failed  : ${#failed_ips[@]}/$total_ips${RESET}"
    echo "--------------------"
    echo ""
    echo -e "Github:${blue} https://github.com/Srithar057${RESET}"
    echo ""
}

ping_check "$1"
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
