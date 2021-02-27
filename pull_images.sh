#!/bin/bash

file="images.properties"

if [ -f "$file" ]
then
  echo -e "$file found, start to pull images"

  while IFS='=' read -r key value
  do
    if [[ "$(docker images -q ${key} 2> /dev/null)" == "" ]]; then
      if [[ "$(docker images -q ${value} 2> /dev/null)" == "" ]]; then
        echo -e "Start pull ${key} \n"
        docker pull ${value}
        docker tag ${value} ${key}
        docker rmi ${value}
        echo -e "\n Pull ${key} successed."
      else
        docker tag ${value} ${key}
      fi
    else
      echo -e "Image exeists. \n"
    fi
  done < "$file"

else
  echo -e "Do nothing as $file not found. \n"
fi
