#!/usr/bin/env bash
#
# install.sh
#
# Generate user_config.sh and set up .bashrc so that it
# sources main.sh

############################################################
# Generate user_config.sh
############################################################

# Let the user enter the value of a variable that should
# be set in user_config.sh. The first argument to this
# function is the variable name, the second the description
# of what is inside the variable.
read_variable() {
    local varname description
    varname=$1
    description=$2

    echo ""

    if [[ ${!varname} ]]
    then
        echo "$description is already set."
        echo "$varname=${!varname}"
        read -p "Do you wish to overwrite? [y/N] " INPUT
    
    	if [[ "$INPUT" == "y" ]]
    	then
            read -p "Enter $description: " INPUT 
            echo "# $description" >> user_config.sh
            echo "export $varname=\"$INPUT\"" >> user_config.sh
    	else
            echo "keeping old value"
            echo "# $description" >> user_config.sh
            echo "export $varname=\"${!varname}\"" >> user_config.sh
    	fi
    else
    	read -p "Enter $description: " INPUT 
    	echo "export $varname=\"$INPUT\"" >> user_config.sh
    fi
}

echo "#" > user_config.sh
echo "# user_config.sh" >> user_config.sh
echo "#" >> user_config.sh
echo "# This is a generated file. It contains the user_config that" >> user_config.sh
echo "# were set by the user at install time." >> user_config.sh
echo "#" >> user_config.sh
echo "" >> user_config.sh


read_variable PROJECTS_FOLDER "your projects root folder"


############################################################
# Modify .bashrc
############################################################
script_dir_path=$(dirname $(readlink -f $0))

if [[ $SCRIPT_DIR_PATH ]]
then
    echo ""
	echo ".bashrc is already configured."
else
	echo "" >> ~/.bashrc
	echo "# Scripts config" >> ~/.bashrc
    echo "export SCRIPT_DIR_PATH=$script_dir_path" >> ~/.bashrc
	echo "source \$SCRIPT_DIR_PATH/main.sh" >> ~/.bashrc
fi
