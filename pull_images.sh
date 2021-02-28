#!/bin/bash

file="images.properties"

if [ -f "$file" ]; then
  echo -e "Start to pull images\n"

  while IFS='=' read -r key value
  do
    if [[ "$(docker images -q ${key} 2> /dev/null)" == "" ]]; then
      echo -e "Start pull ${key} \n"
      if [[ -z "${value}" ]]; then
        docker pull ${value}
      else
        if [[ "$(docker images -q ${value} 2> /dev/null)" == "" ]]; then
          docker pull ${value}
          docker tag ${value} ${key}
          docker rmi ${value}
        else 
          docker tag ${value} ${key}
        fi
      fi
      echo -e "Pull ${key} successfully. \n"
    else
      echo -e "Image ${key} exeists. \n"
    fi
  done < "$file"
else
  echo -e "Do nothing as $file not found. \n"
fi