#!/usr/bin/env bash

if hash pip-chill &>/dev/null; then
  pip-chill >~/.requirements.txt
else
  pip3 freeze >~/.requirements.txt
fi
