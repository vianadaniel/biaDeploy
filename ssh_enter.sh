#!/bin/bash

public_ip=$(terraform show | grep -E 'public_ip[ ]*=' | awk -F'=' '{print $2}' | tr -d ' "')
echo "EC2 IP: $public_ip"

echo "Login in EC2"

ssh -o StrictHostKeyChecking=no -i Terraform.pem ubuntu@$public_ip
