#!bin/bash
sudo apt-get update
echo "Installing"
sudo apt-get install -y docker.io docker-compose make
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo systemctl start docker
IP=$(curl -s https://api64.ipify.org)
git clone https://github.com/vianadaniel/bia.git
cd bia
sed -i "s|localhost:3001|$IP:80|g" Dockerfile
sed -i "s|3001:8080|80:8080|g" docker-compose.yml
echo $IP "Changed Dockerfile and docker-compose.yml"
sudo docker-compose up --build -d
docker exec -it bia npx sequelize db:migrate
