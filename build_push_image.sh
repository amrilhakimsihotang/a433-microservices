#!/bin/bash

# Perintah untuk membuat Docker image
docker build -t item-app:v1 .

# Daftar image di lokal docker
docker images ls

# Mengubah nama image
docker tag item-app:v1 amril2023/item-app:v1

# Login ke Docker Hub
docker login

# Upload image ke Docker Hub
docker push amril2023/item-app:v1
