#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
RESET='\033[0m'
blue='\033[1;34m'

ip_file="$1"
oc=$(cat $ip_file | wc -l)
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
ping_check() {
echo "--------------------"
    Success=0
    Failed=0
    while IFS= read -r ip; do

        if ping -c 1 "$ip" &> /dev/null; then

            echo -e "${GREEN} $ip ${RESET}"
            ((Success++))
        else

            echo -e "${RED} $ip ${RESET}"
            ((Failed++))
        fi
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
    done < "$ip_file"

    echo "--------------------"
    echo "Results Count:"
    echo -e "${GREEN} Success : $Success/$oc${RESET}"
    echo -e "${RED} Failed  : $Failed/$oc${RESET}"
    echo "--------------------"
    echo ""
    echo -e "Github:${blue} https://github.com/Srithar057${RESET}"
    echo ""
}
# Linkedin - https://in.linkedin.com/in/sritharparthasarathi
ping_check
