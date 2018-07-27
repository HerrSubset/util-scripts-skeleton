#
# builtins.sh
#
# Utility functions that can be loaded and used by other
# scripts.

# Check if a binary is on the path. If not, exit the 
# current process.
# argument 1: the binary that should be present
# argument 2: an optional error message
assert_installed() {
	local program_name=$1
	local message=$2

	if [[ ! $(which $program_name 2> /dev/null ) ]]
	then
		echo "$message"
		exit 1	
	fi
}

# Check if an environment variable is set. If not, exit the
# current process.
# argument 1: the variable that has to be set
# argument 2: an optional error message
assert_value_set() {
	local varname=$1
	local message=$2

	if [[ -z ${!varname} ]]
	then
		echo "$message"
		exit 1
	fi
}
