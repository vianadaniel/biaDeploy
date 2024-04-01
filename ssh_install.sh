#!/bin/bash
terraform apply -auto-approve

sleep 30

while true; do
  public_ip=$(terraform show | grep -E 'public_ip[ ]*=' | awk -F'=' '{print $2}' | tr -d ' "')
  if [ -n "$public_ip" ]; then
    echo "EC2 IP: $public_ip"
    break
  fi
  echo "Waiting for EC2 be ready..."
  sleep 60
done

echo "Login in EC2"

ssh -o StrictHostKeyChecking=no -i Terraform.pem ubuntu@$public_ip 'bash -s' < user_data.sh
