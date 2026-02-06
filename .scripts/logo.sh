#!/bin/bash

set -eo pipefail

HLINE=$(printf '%*s' 60 '' | tr ' ' '*')
LINE_1="PQ Box 400"
LINE_2="a-eberle.de"
LINE_3="Copyright (c) 2025 A.Eberle GmbH & Co.KG"

if ! command -v figlet &>/dev/null; then
    echo "$HLINE"
    echo "$LINE_1"
    echo "$LINE_2"
    echo "$LINE_3"
    echo "$HLINE"
else
    (figlet -f slant -w 60 -r $LINE_1; figlet -f small -w 60 -r $LINE_2; figlet -f term  -w 60 $LINE_3) | grep -v '^[[:space:]]*$'
fi


