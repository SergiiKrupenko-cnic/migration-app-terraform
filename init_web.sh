#!/bin/bash -ex

  apt update -y
  apt install nginx -y

  systemctl enable nginx
  systemctl start nginx