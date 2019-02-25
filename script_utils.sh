#
# script_utils.sh
#
# Utilities to reload, reconfigure or upgrade the scripts.
#


# Re-load the functions and variable definitions into the 
# current bash session. Scripts don't have to be reloaded, 
# when executing them, the latest version is always 
# retrieved via the PATH.
scripts-reload() {
	source "$SCRIPT_DIR_PATH/main.sh"
}


# Show all configured variables to the user, and allow the 
# user to change their values. This is essentially the same
# as re-running the configuration script and restarting the
# shell.
scripts-reconfigure() {
	cd "$SCRIPT_DIR_PATH"
	./install.sh
	cd -
	scripts-reload
}

# Go into the script folder, get the latest updates with git
# and run the install script again to configure any possible
# new configuration values.
scripts-upgrade() {
	cd "$SCRIPT_DIR_PATH"
	git pull
	cd -
	scripts-reconfigure
}
