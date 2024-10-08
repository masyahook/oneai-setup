#!/bin/bash

# [optional] Install screen, useful when creating detached processes
sudo apt update
sudo apt install screen -y

# Create conda environment with required python version
conda init bash
source /opt/conda/etc/profile.d/conda.sh

cd /home/oneai/oneai-rnd-icd-template

# Install db env
conda env remove -n icd || true
make create-env &&
conda activate icd &&
make db-setup

# Install test env
conda env remove -n icd_test || true
make test-env &&
conda activate icd_test &&
make spark-setup

# Install Github Copilot CLI
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
    sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
    sudo apt update &&
    sudo apt install gh -y
gh extension install github/gh-copilot

echo "end of script"