#
# builtins.sh
#
# Utility functions that can be loaded and used by other
# scripts.

# Check if a binary is on the path. If not, exit the 
# current process.
# argument 1: the binary that should be present
assert_installed() {
	local program_name=$1

	if [[ ! $(which $program_name 2> /dev/null ) ]]
	then
		die "This command requires '$program_name' to be installed and on the PATH"
	fi
}

# Check if a variable in user_config.sh is set. If not,
# exit and tell the user to set the variable by running
# scripts-reconfigure.
assert_configured() {
	local varname=$1

	if [[ -z ${!varname} ]]; then
		die "$varname is not set. Please run 'scripts-reconfigure' and set it."
	fi
}

# Print an error message in red and exit the script.
die () {
	echo -e "\033[0;31m[ERROR] $1\033[0m"
	exit 1
}

# Print a warning message in brown/orange
warn() {
	echo -e "\033[0;33m[WARNING] $1\033[0m"
}

