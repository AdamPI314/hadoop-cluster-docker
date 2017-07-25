#!/bin/sh

reg_cert () {
  if [ "$1" ]
  then  
    docker-machine regenerate-certs $1
  fi
}

reg_cert $1
