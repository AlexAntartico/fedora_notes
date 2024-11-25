#!/bin/bash

# fetch name for venv

read -p "Enter the name of the new repo: " name

# Create directory and navigate into it:
mkdir "$name"
cd "$name"

# Create venv
python -m venv venv

# Activate venv
source venv/bin/activate

# upgrade pip
python -m pip install --upgrade pip

# Install the required packages
pip install pandas jupyter matplotlib numpy seaborn

git init

echo "Virtual environment '$name' created and activated."
echo "Packages installed: pandas, jupyter, matplotlib, numpy seaborn"
echo "git tracking initiated"
