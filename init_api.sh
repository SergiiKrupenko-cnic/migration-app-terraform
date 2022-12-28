#!/bin/bash -ex

sudo apt update -y
sudo apt install nginx -y
sudo apt install gunicorn3 -y
sudo apt install python3-venv python3-pip
pip install flask
pip install flask_cors
systemctl enable nginx
systemctl start nginx