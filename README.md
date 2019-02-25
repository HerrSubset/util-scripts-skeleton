# Util Scripts Skeleton

A fairly simple skeleton to add some scripts to. It can be
used to easily share some bash scripts between multiple
people.


## How does it work?

After running the `install.sh` script, your `.bashrc` will
load the `main.sh` file. This file modifies your path to
include the bin folder that's present in the project.

Besides that, you can also make it load other shell files
where you declare variables and/or functions that you want
to load every time your shell opens.


## Getting started

There are two ways to add commands that users can execute.
The first is by creating scripts in the /bin folder of
the project.  `main.sh` modifies the path so that all 
scripts in this folder are executable.

The second way to add commands is by creating new bash
files, adding functions to them and loading them from 
`main.sh`.  For example, you create a file `foobar.sh` 
with the following content:

```bash
foobar() {
    echo "Hello, world!"
}
```

This will allow you to run the `foobar` command if you load
this file from `main.sh`. This is done by adding following 
line to `main.sh`:

```
    source "$SCRIPT_DIR_PATH/foobar.sh"
```

The `$SCRIPT_DIR_PATH` is set automatically when upon 
`install.sh`. In case you want to define your own variables, 
that's possible too. Constants can be defined in any file 
loaded by `main.sh`.

Variables that depend on the user can be set by 
`install.sh`. This file provides the `read_variable`
function. Just call it for every variable you want the user
to fill in. Usage is as follows: 
`read_variable <variable_name> <description>`. These 
variables will be available in your shell just like the
functions you add. This also means that you can use them
in your functions. They are put in the auto-generated file
`user_config.sh`. It's best not to add any variables 
directly to this file. They will be removed whenever the
install script is run.


## Provided functionality

The skeleton comes with a few functions you can run out of
the box.

 * `scripts-reload` reloads all your scripts and variables.
   It allows you to reload everything without restarting
   your shell. Useful when modifying scripts

 * `scripts-reconfigure` will re-run the installation,
   allowing you to modify the variables you've set.

 * `scripts-upgrade` upgrades all your scripts by pulling
   new changes from the git remote and running 
   scripts-reconfigure.

 * `p` is a simple example script that was added to the
   skeleton. The installation will prompt you for the
   `PROJECTS_FOLDER` variable. With `p`, you can go 
   directly to a project in this folder. Example usage:
   `$ p my_directory`.
   This command serves as a good example of how to add
   your own things (and I just use it all the time).

