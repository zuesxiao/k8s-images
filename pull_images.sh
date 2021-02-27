#!/bin/bash

file="images.properties"

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    echo "Start pull ${key},"
    docker pull ${value}
    docker tag ${value} ${key}
    docker rmi ${value}
    echo "Pull ${key} successed."
  done < "$file"

else
  echo "Do nothing as $file not found."
fi
