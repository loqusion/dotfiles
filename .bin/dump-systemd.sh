#!/bin/bash

systemctl --type=service | sed -r -e '/^[^ ]/d' -e '1d' -e '/^\W*$/d'
