#!/usr/bin/bash
script_file_name=$(find $(pwd) -name tihttp.py)
# echo "alias tihttp='${script_file_name}'" >> ~/.bashrc  # alias tihttp='${script_file_name}'
# source ~/.bashrc
file=/usr/bin/tihttp
if [ -e "$file" ]; then
	echo "Old binary file detected, It must be removed, in first."
	sudo rm /usr/bin/tihttp
	echo "OK!"
fi
sudo ln -s ${script_file_name} "$file"
