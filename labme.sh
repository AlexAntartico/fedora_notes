#!/bin/bash

# fetch name for venv
read -p "Enter the name of the new repo: " name

# Create directory and navigate into it:
mkdir "$name"
cd "$name" || exit
mkdir data
touch 01_eda.ipynb

# Create venv
python -m venv venv

# Activate venv
source venv/bin/activate || { echo "Failed to activate venv"; exit 1; }

# upgrade pip
pip install --upgrade pip

curl https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore > ./.gitignore

git init
git add .gitignore  # Stage .gitignore first
git add .  # stage remaining files
git rm -r --cached ./venv

# Install the required packages
pip install pandas jupyterlab matplotlib numpy seaborn

# check if jupyter exists in path and attempt reinstall
if ! command -v jupyter &> /dev/null
then
    echo "JupyterLab installation failed. Attempting to reinstall."
    pip install jupyterlab
fi

echo "Virtual environment '$name' created and activated."
echo "Packages installed: pandas, jupyterlab, matplotlib, numpy seaborn"
echo "git tracking initiated"
echo ".gitignore python templated added"

# Run jupyter lab in the background and capture url
nohup jupyter lab &> nohup.out &

# to give time for server to start and fetch urls
sleep 5

# Print jupyter lab url
jupyter notebook list


echo "Jupyter Lab running in the background. Access it at the URL above."

