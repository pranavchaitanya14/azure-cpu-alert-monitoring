#!/bin/bash
sudo apt update -y
sudo apt install stress -y
stress --cpu 4 --timeout 300
