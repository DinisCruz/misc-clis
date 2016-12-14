#!/bin/bash

echo
echo "Note: run this using . ./set-cert-pwd.sh to set the variable in the host bash (it is expected that the bbc-cert.p12 is in the current path"
echo "What is the .p12 password: "
read -s pwd
export P12_PWD=$pwd

echo "The password has been set to the P12_PWD variable"
echo
echo "Testing using:"
echo
echo "curl -s --cert bbc-cert.p12:\$P12_PWD  \"https://confluence.dev.bbc.co.uk/rest/api/content/?limit=0&start=0\"   | python -mjson.tool "
echo

curl -s --cert bbc-cert.p12:$P12_PWD  "https://confluence.dev.bbc.co.uk/rest/api/content/?limit=0&start=0"   | python -mjson.tool 