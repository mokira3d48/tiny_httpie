#!/usr/bin/bash

if [[ ! -d ~/tihttp ]]; then
    mkdir ~/tihttp
    folder1=~/tihttp
    echo "${folder1} was generated."
fi
if [[ ! -d ~/tihttp/tinyHTTPie ]]; then
    mkdir ~/tihttp/tinyHTTPie
    folder2=~/tihttp/tinyHTTPie
    echo "${folder2} was generated."
fi

PWD=$(pwd)
REQUIREMENTS="$PWD/requirements.txt"
PY_SCRIPT="$PWD/tihttp.py"
TARGET=~/tihttp/tinyHTTPie

cp "$REQUIREMENTS" "$TARGET"
cp "$PY_SCRIPT"    "$TARGET"
# cd ~/tihttp/tinyhttp

# python_file_name=$(find $(pwd) -name tihttp.py)
PY_FILE="$TARGET/tihttp.py"
CMD_NAME=/usr/bin/tihttp

sudo chmod +x "$PY_FILE"

if [ -e "$CMD_NAME" ]; then
	echo "Old binary file detected, It must be removed, in first."
	sudo rm "$CMD_NAME"
	echo "OK!"
fi
# sudo ln -s "$PY_FILE" "$CMD_NAME"

# if [[ ! $(python3 -m venv "$TARGET/env") ]]; then
#	echo "You must to install python3-venv."
#	sudo apt install python3-venv
# fi

source "$TARGET/env/bin/activate"

# if [[ ! $(pipenv) ]]; then
#    echo "pipenv not existent, so installing via pip..."
#    pip install pipenv
#    echo "...pipenv was installed?"
# fi
