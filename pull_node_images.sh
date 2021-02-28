#!/bin/bash

key="k8s.gcr.io/kube-proxy:v1.20.4"
value="zeusxiao/kube-proxy:v1.20.4"

if [[ "$(docker images -q ${key} 2> /dev/null)" == "" ]]; then
  if [[ "$(docker images -q ${value} 2> /dev/null)" == "" ]]; then
    echo -e "Start pull ${key} \n"
    docker pull ${value}
    docker tag ${value} ${key}
    docker rmi ${value}
    echo -e "\n Pull ${key} successfully."
  else
    echo -e "Image ${value} exeists, just need change tag. \n"
    docker tag ${value} ${key}
    echo -e "Tag change successfully. \n"
  fi
else
  echo -e "Image ${key} exeists. \n"
fi
