#
# maintainance.sh
#
# Provide some functions to make working with this skeleton
# a bit easier. Current functionality includes:
#   - Reloading all scripts so you don't need to restart
#     your shell when you modified some things.
#   - Reconfiguring the install variables.
#   - Upgrading your scripts. Uses git to pull from a
#     remote repository.

scripts-reload() {
    source "$SCRIPT_DIR_PATH/main.sh"
}

scripts-reconfigure() {
    "$SCRIPT_DIR_PATH/install.sh"
    scripts-reload
}

scripts-upgrade() {
    echo "Upgrading scripts is not implemented yet"
}
