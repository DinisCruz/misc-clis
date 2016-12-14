#!/usr/bin/env bash

function jenkins-cli-about {
    echo
    echo "Created by Dinis Cruz, source code hosted at https://github.com/DinisCruz/misc-clis"
    echo
}

function jenkins {
  local action=$1
  local param_1=$2

  echo $param_1
  java -jar jenkins-cli.jar -s http://192.168.99.100:8080/ $action "$param_1"
}



# example . ./cli.sh ;jenkins console "Elysium scans/elysium clone"
