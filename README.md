# Util Scripts Skeleton

A fairly simple skeleton to add some scripts to. It can be
used at work to easily share some bash scripts between you 
and your colleagues.


## How does it work?

After running the `install.sh` script, your `.bashrc` will
load the `main.sh` file. This file then further loads
some other files and variables. In the files that are being
loaded, you can declare variables and functions. Since they
are loaded every time your shell starts, you will be able
to use them from anywhere in your file system, just like
binaries on your PATH.


## Getting started

Commands are added by creating new files and loading them
from `main.sh`. For example, you create a file `foobar.sh`
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

`$SCRIPT_DIR_PATH` is a variable that set automatically
when running `install.sh`. In case you want to define
your own variables, that's possible too. Constants can be
defined in any file loaded by `main.sh`.

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

 * `scripts-upgrade` is still unimplemented. In the future
   it should allow you to upgrade all your scripts when
   other users have pushed changes to your git remote.

 * `p` is a simple example script that was added to the
   skeleton. The installation will prompt you for the
   `PROJECTS_FOLDER` variable. With `p`, you can go 
   directly to a project in this folder. Example usage:
   `$ p my_directory`.
   This command serves as a good example of how to add
   your own things (and I just use it all the time).

