#/bin/sh
# Note you must use infraexp account
# aws-vault exec infraexp-admin

# Login to ECR for pull https://github.com/aws-samples/bedrock-access-gateway/
# 366590864501.dkr.ecr.eu-central-1.amazonaws.com/bedrock-proxy-api-ecs:latest
aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 366590864501.dkr.ecr.eu-central-1.amazonaws.com
docker pull 366590864501.dkr.ecr.eu-central-1.amazonaws.com/bedrock-proxy-api-ecs:latest

# Pull open-webui image
docker pull ghcr.io/open-webui/open-webui:main

# Start local ollama server. Please install olama first
# ollama by default using 127.0.0.1:11434
ollama serve

docker-compose up -d

echo "Wait for 10 seconds for the webui to start"
sleep 10

# Open webui in browser
open http://localhost:3000