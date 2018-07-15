Author: *Ryan Leulmi*\
Course/Reference: *Bash Shell Scripting*\
Professor: *Sander Van Vugt*
----


## Creating your first bash script
----

### Core Bash Script Ingredients
1) Starts with a **shebang** `#!/bin/bash` , which tells the shell which language we are using.
   - **#** or **hash** is used normally as a comment sign
2) Comments and white space are very imporant to the overall readability / understanding of the script.
3) An exit statement if you don't want to use the exist status of the last command in the script.
4) The script has to have execute permissions `chmod +x myscript`
5) It's very advisable to run scripts in your current directory using `./script`, because otherwise you 
   might encounter some unwanted behaviour from other scripts that have the same name.
   - A script has to be in one of the directories that are included in the **$PATH** variable , which
     will allow the script to run without **./**
6) The `which script` looks up the path variable to see if any of the dirs contain the script. 
#### Internal vs External utilties
- Internal commands are a part of the bash shell so it doesn't have to be loaded from disk.
- Extenral commands are loaded from an executable file on disk , therefore its slower .
- `type script` is a command that is useful to recognise bash internal commands . 
- In Case there is a name conflict , bash shell will always pick the internal command .

#### Finding Help Bash Scripting
- `man bash` and`bash --help | less` contain large amount of local offline docs .
- The Advanced Bash-Scripting Guide on tldp.org for online docs.

```bash
#!/bin/bash # the interpreter that will be used by your shell

# Author : Ryan
# First Bash Script
# ./hello-bash

# clear the console and print to stdout
clear
echo "hello world from bash"

exit 0
```

### First Bash Exercise

```bash
# Author : Ryan
# This script creates a backup of /var/log/syslog & it wipes it .

echo "your log file is getting backed up" # print
cp /var/log/syslog /var/log/syslog.old    # copy
cat /dev/null > /var/log/syslog           # wipe
echo "your log file has been backed up"   # print

exit 0                                    # exit / return
```

## Working with Variables & Parameters

### Common Terminology :-
- **Arguments** are anything that is used after a command & that includes options & paths.
- **Options** are arguments that were developed to change the behaviour of certain commands.
- **Parameters** are declared and defined inside scripts.
- **Variables** are labels stored in memory that have a certain value.

Working with variables and data structures in general makes scripts more flexible
by introducing a layer of abstraction for some of the inputs.

### There are a couple of ways to declare / define variables :-

1) Staticly declare & define the variable in a script using `VARNAME=value`
2) As as an argument by using `$VARNAME`.
3) Interactively prompt the user for values / input.


### A Couple of Examples involving Variables :-

#### clearLog Script

```bash
# This script will backup a file & wipe it
# Lets assume that we have a diretory /backups where
```

