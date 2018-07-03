#
# naviagtion.sh
#
# Some helper functions for navigating the file tree.
# 


############################################################
# p
#
# Navigate to a folder in your projects folder. The 
# projects folder is defined by $PROJECTS_FOLDER.
# Autocomplete is available for this command.
#
# Example usage: 'p my_awesome_project'
############################################################
p() {
	cd "$PROJECTS_FOLDER/$1"
}

__p_autocomplete() {
	local cur prev projects
	projects=`ls $PROJECTS_FOLDER`

	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	COMPREPLY=( $(compgen -W "${projects}" -- ${cur}) )

	return 0
}
complete -o nospace -F __p_autocomplete p

