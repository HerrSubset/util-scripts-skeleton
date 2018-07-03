# Util Scripts Skeleton

A fairly simple skeleton to add some scripts to. It can be
used at work to easily share some bash scripts between you 
and your colleagues.


## How does it work?

After running the `install.sh` script, your `.bashrc` will
source the `main.sh` file. This file then further loads
some other files and variables. You can add your own files
and add them to `main.sh` to have them loaded.


## Provided functionality

The skeleton comes with a few functions you can run
already:

 * `scripts-reload` reloads all your scripts and variables.
   It allows you to reload everything without restarting
   your shell. Useful when modifying scripts

 * `scripts-reconfigure` will re-run the installation,
   allowing you to modify the variables you've set.

 * `scripts-upgrade` is still unimplemented. In the future
   it should allow you to upgrade all your scripts when
   other users have pushed changes to your git remote.

 * `p` is a simple example script that was added to the
   skeleton. The installation will prompt you for the
   `PROJECTS_FOLDER` variable. With `p`, you can go 
   directly to a project in this folder. Example usage:
   `$ p my_directory`


## Installation

Clone/fork this repository and put it on your local
machine. Then run the `install.sh` script to set everything
up. You now have all the provided functionality described
above.

To add your own scripts, add new files where you define 
bash functions. Source these new files from `main.sh` and
they should be accessible when you restart your shell or
run `scripts-reload`.

