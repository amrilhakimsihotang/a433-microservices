
# Konfigurasi
GITHUB_USERNAME="amrilhakimsihotang"
GITHUB_TOKEN="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"
IMAGE_NAME="amril2023/karsajobs"
IMAGE_TAG="latest"
REPOSITORY="a433-microservices"

#1. Perintah build docker image untuk backend
echo "Membuat Docker image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG . 

# Tagging image untuk GitHub Container Registry..
echo "Tagging Docker image untuk GitHub Container Registry..."
docker tag $IMAGE_NAME:$IMAGE_TAG ghcr.io/$GITHUB_USERNAME/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

#2.Login ke GitHub Container Registry(menerapkan saran kedua)
echo "Masuk ke GitHub Container Registry..."
echo $GITHUB_TOKEN | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

#3.Push image ke GitHub Container Registry(menerapkan saran kedua)
echo "Push image ke GitHub Container Registry..."
docker push ghcr.io/$GITHUB_USERNAME/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG

# Logout dari GitHub Container Registry
echo "Logout dari GitHub Container Registry..."
docker logout ghcr.io

# Image upload selesai
echo "Image upload selesai!"