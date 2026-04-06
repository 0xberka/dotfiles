#!/bin/bash

set -eux

git config --global user.name  "Mohamed Ait Oubarka"
git config --global user.email "droubarka@gmail.com"

git config --global init.defaultBranch main
git config --global core.editor        nano
git config --global color.ui           auto
git config --global status.short       true

