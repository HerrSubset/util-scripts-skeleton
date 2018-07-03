#!/usr/bin/env bash
#
# install.sh
#
# Generate user_config.sh and set up .bashrc so that it
# sources main.sh

############################################################
# Generate user_config.sh
############################################################

echo "#" > user_config.sh
echo "# Autocomplete.sh" >> user_config.sh
echo "#" >> user_config.sh
echo "# This is a generated file. It contains the user_config that" >> user_config.sh
echo "# were set by the user at install time." >> user_config.sh
echo "#" >> user_config.sh
echo "" >> user_config.sh


if [[ $PROJECTS_FOLDER ]]
then
	echo "Projects folder is already set."
	read -p "Do you wish to overwrite? [y/N] " INPUT

	if [[ "$INPUT" == "y" ]]
	then
		read -p "Enter the path to the projects root folder: " INPUT 
		echo "export PROJECTS_FOLDER=\"$INPUT\"" >> user_config.sh
	else
		echo "keeping old value"
		echo "export PROJECTS_FOLDER=\"$PROJECTS_FOLDER\"" >> user_config.sh
	fi
else
	read -p "Enter the path to the projects root folder: " INPUT 
	echo "export PROJECTS_FOLDER=\"$INPUT\"" >> user_config.sh
fi


############################################################
# Modify .bashrc
############################################################
script_dir_path=$(dirname $(readlink -f $0))
# local script_dir_name=$(basename $SCRIPT_DIR_PATH)

if [[ $SCRIPT_DIR_PATH ]]
then
	echo ".bashrc is already configured."
else
	echo "" >> ~/.bashrc
	echo "# Scripts config" >> ~/.bashrc
    echo "export SCRIPT_DIR_PATH=$script_dir_path" >> ~/.bashrc
	echo "source \$SCRIPT_DIR_PATH/main.sh" >> ~/.bashrc
fi
