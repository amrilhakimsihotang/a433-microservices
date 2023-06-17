#!/bin/bash

# Konfigurasi
GITHUB_USERNAME="amrilhakimsihotang"
GITHUB_TOKEN="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"
IMAGE_NAME="item-app"
IMAGE_TAG="v1"
REPOSITORY="a433-microservices"

# Membuat image Docker
echo "Membuat Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG . 

# Tagging image untuk GitHub Container Registry..
echo "Tagging Docker image untuk GitHub Container Registry..."
docker tag $IMAGE_NAME:$IMAGE_TAG ghcr.io/$GITHUB_USERNAME/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

# Login ke GitHub Container Registry
echo "Masuk ke GitHub Container Registry..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Push image ke GitHub Container Registry
echo "Push image ke GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

# Logout dari GitHub Container Registry
echo "Logout dari GitHub Container Registry..."
docker logout ghcr.io

# Image upload selesai
echo "Image upload selesai!"
