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
3) An exit statement if you don't want to use the exit status of the last command in the script.
4) The script has to have execute permissions `chmod +x myscript`
5) It's very advisable to run scripts in your current directory using `./script`, because otherwise you 
   might encounter some unwanted behaviour from other scripts that have the same name.
   - A script has to be in one of the directories that are included in the **$PATH** variable , which
     will allow the script to run without **./**
6) The `which script` looks up **$PATH** variable to see if any of the dirs contain the script. 
#### Internal vs External utilties
- Internal commands are a part of the bash shell so it doesn't have to be loaded from disk.
- Extenral commands are loaded from an executable file on disk , therefore its slower .
- `type script` is a command that is useful to recognise bash internal commands . 
- In Case there is a name conflict , bash shell will always pick the internal command .
#### Finding Help Bash Scripting
- `man bash` and `bash --help | less` contain large amount of local offline docs .
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
- **Argument** anything that comes after a command when starting a script
- **Options** are arguments that were developed to change the behaviour of certain commands.
- **Parameters** are declared and defined inside scripts.
- **Variables** are labels stored in memory that have a certain value.

Working with variables and data structures in general makes scripts more flexible
by introducing a layer of abstraction for some of the inputs.

### There are a couple of ways to declare / define variables :-

1) Staticly declare & define the variable in a script using `VARNAME=value`
2) As as an argument by using `$VARNAME`.
3) Interactively prompt the user for values / input.

### Bash Naming Conventions :-

- Environment variables are upper-case to differentiate them from normal user vars
- It is advisable to use lower case variable names while scripting.

### A Couple of Examples involving Variables :-

#### calcage script

```bash
#!/bin/bash
# This script will calculate a user's age based on the birth year
 
# Prompt the user & read/save the value
echo Enter your birth year to calculate your age ...
read year

# calculate the user's age & store it in a variable
age=$((`date +%Y` - $year ))
echo Your age is ${age}
```

### Variables & Subshells :-

- A variable is effective only in the shell where it was defined.
- We can use `export` a variable to make it available in subshells.
- Scripts are usually executed in subshells unless specified otherwise.
- There is no way to access subshells' variables from parent shells.

### Defining Variables at the Start of a Shell :-

1) **/etc/profile** is processed when a user logs in.
   - All variables defined here are available in all subshells of that user.
   - **~/.bash_profile** is the user specific config.
2) **/etc/bashrc** is processed when a user opens a subshell.
   - Variables defined here are available to the users whenever they open a subshell.
   - **~/.bashrc** is the user specific config.
   
### Sourcing :-

- Sourcing allow us to include the contents of script in another script .
  The seperation between dynamic & static code will help with the readability and
  code organisation.
- Dynamic code usually consists of functions , variables & arrays.
- Use `source` or `.`  to include scripts & don't use `exit`.

### Quoting :-

- The bash shell has a bunch of special characters like **\***,**$**, wildcards , etc.- When a command is interpreted by the shell, the shell interprets all special chars.
   - The process is known as **command line parsing**
- Commands themselves may interpret parts of the command line as well.
- Quoting is used to ensure that a special character is interpreted by the command not the shell .
- Single Quots make a string's special characters uninterpretable by bash.
- Double Quots are weak because they treat only some characters as special.
- We can use a back slash to escape / ignore the following special character.
- Best practice is to use single quots unless you need to use something else.

### Handling Script Arguments :-

- Any argument that was supplied when starting a script , can be dealt with from within the script.
- **$1 - $9** to refer to arguments from within the script.
- **${nn} or shift** to refer to the arguments that are beyond 9 .
   - shift is more compatible with older systems and other shells.
   - shift throws away the first argument or the first node of the list.
- **$@** to refer to all arguments as an array / a list.
- **$#** refers to the number of arguments provided to the script.
- **$\*** is a single string that contains all arguments  , and it is used in rare occasions.
- Arguments are read only so they can't be modified from within the script.
   - You can assign the Argument to a local variable if you want to modify it.

### Command Substitution :-

- Substitution allow us to use the result / output of a command in another script / command .
- It provides ultimate flexiblility .
   - **$(command) preferred**
   - **`command`** deprecated

### Here Documents :-

- In a here document , I/O redirection is used to feed a command list into a program / command such as an instance of ftp or cat .
- It is usually used to write long comments / prompts or with ftp clients.

## Transforming Input

### Understading Substitution Operator :-

A substituion operator allow us to manipulate values of variables in an easy way.
The substitution operator is used to :-
- Ensure that a variable exists.
   - `${var:-word}` if var exists use its value and ,if not return **word**
- Set Default values for variables.
   - `${var:=word}` if var exists use its value , and if not set the default to **word**
- Catch errors that result from variables that don't exist
   - `${var:?msg}` if var exists show its value , if not display var and the msg
- Remove portions of variable values (show substrings)
   - ${var:offset:len}
   - ${string:0:3} will display str
