#!/bin/bash

# Configure git
# - Set global user
git config --global user.name "iuliandonici"
git config --global user.email "iuliandonici@gmail.com"
# - Initiate a git repository
git init
# - Clone the repositories: busychrome
git clone git@github.com:iuliandonici/busychrome.git
# - Clone the repositories: neotestertheme
git clone git@github.com:iuliandonici/neotestertheme.git
# Add remote "busychrome" repository
git remote add busychrome git@github.com:iuliandonici/busychrome.git
# - Add remote "neotestertheme" repository
git remote add neotestertheme git@github.com:iuliandonici/neotestertheme.git

