Author: **Ryan Leulmi**\
Course/Reference: **LFCS**\
Professor: **Sander Van Vugt**
----
# Performing Basic System Admin Tasks :-

##  1 - Using Essential Tools

### 1.1 - How to find documentations or help in a linux system
----
#### 1) Get some help by appending `--help` to a familiar command
__*Example :-*__

- `ls --help` This command will output a bunch of options and instructions on the usage of `ls`.
- `ls --help | less` Pipe the output of `ls` to the `less` pager to improve the readability.
- Using `--help` can be more useful than using the `man`command in some cases.

#### 2) Access the manual using the `man` command
- Man pages have information about the usage of a certain linux command or config.
- Man pages are usually composed of a couple of elements :-
   - **Name** **~>** Name of the command and a brief description.
   - **Synopsis** **~>**      Short overview and a brief demonstration of a certain command.
   - **Description** **~>** Longer specific information about the command or config file.
   - **Options** **~>** List of options and it's description. 
   - **Default Configs** **~>** Default values and notes related to the command or config file.
   - **Related Files** & **See Also** Section **~>** Related Files & Commands.
- The manual has different sections with specific topics :-
   - **Section 1** **~>** User Commands
   - **Section 2 & 3** **~>** Not important for a system adminstrator.
   - **Section 4** **~>** Devices that are connected to the system.
   - **Section 5** **~>** Configuration files.
   - **Section 7** **~>** Different miscellaneous topics and background information about services .
   - **Section 8** **~>** Administration and privileged commands. 
- When you look up a command using `man` , the `man` command looks in 
all the sections(1-9) until it finds something.
   - `man 7 intro` Looks for the introduction in section 7 of the manual.
- Man Pages common syntax , eg : `man ls` 
  ##### Synopsis: `ls [OPTION]... [FILE]...`
   - The square brackets signify that the option is optional.
   - The 3 dots signify that you can add multiple files or options. 
   - Long options are preceded by 2 dashes with some exceptions, eg: `ls --all`
   - Short options are preceded by 1 dash, eg: `ls -a`.
   - [--optionB|--optionA], one pipe for the OR operator.
   - {-x|-y}, the curly braces signify that the option is required.
- Useful commands & options for man :-
   - `/` move to the first match that matches your pattern, and `n` to move to all the  matches.
   - `space` Move by page ( depeneds on the screen size).
   - `G` Move to the last line of the man page.
   - `g` Move to the first of the man page. 
   - `grep` **~>** Universal Linux filtering utility that uses wildcards and regular expressions.
```bash     
man -k "keyword"  # Search the manual descriptions for a keyword.
mandb # Generate or update the database that `-k` counts on.
man -k "user" | wc # Search for " & pass it to the word,char,line counter.
man -k "user" | grep 8 # Look for the "user" keyword  in section 8 of the manual.
man -k "user" | grep -e '8' -e 'add' | less # multiple pipes and greps if needed.
man -a "passwd" # check --all  sections for "passwd" & show all related pages
```

#### 3) Access system docs in `usr/share/doc` 
- Although this is not the recommended choice of docs,it can
be useful in some cases.
 
### 1.2 - Using the Seven Essential Command Line Tools
```bash
whoami # current user's login name
hostname # computer name 
date # set the date and time
uname # information about the system
passwd # change a password or passwords if you are root
touch file.txt file1.py file2.js # create a file or multiple files
last # shows a list of users that have recently loged in
```

### 1.3 - Intro to the linux shell , globbing and wildcards 
---
####  Linux shell features :-
- **Bash** is a command interpreter that transforms commands into a desired output.
- **history** is a command that allows us to look up previously used commands.
   - `!n` Execute a certain command based on its (n)umber in the history.
   - Last 1000 commands are written in a history file to survive reboots.
- **Reverse search** by pressing `Ctrl-r` then type a command.
   - The shell looks for the last used command that starts with (string).
   - Ctrl-r to cycle through previously used commands that start with abc.
- **Bash completion** with the *Tab* key.
   - Completes a command if there was 1 command that starts with the input
   - Double Tab to show multiple choices that start with input.
   - There will be more commands to complete when you are root.
- **Globbing / Wildcards** are used to match file names and paths.
```bash
   ls host* # starts with "host" and followed by (* = anything).
   ls ?ost  # starts with ( ? = random character) followed by "ost".
   ls [hp]ost # starts with either [h|p] and followed by "ost".
   ls [!hp]ost # starts with any char but h|p and followed by "ost".
```
#### I/O redirections and pipes :-
 
- Pipes and I/O redirections are two important concepts in linux.
- **STDIN** (standard input), can be either a user's input or some data `<` redirected from a file or variable.
- **STDOUT** (standard output),this is usually the output that appears on a linux shell
  when we enter a valid linux command , and we can also redirect the output to a file using `>` to
  overwrite the current file if it exists or `>>` to append to an exisiting file .
- **STDERR** (standard error), refers to the error messages that might show
up when an error is caught . We can redirect it to a file using `2>` which will make the error easier to read.
- In a pipe you take the output of the previous command and use it as the
input of the next command.
- `man -k password | less` , `man -k password` will produce an output that will be used by the `less`
  pager as it's input 
----

## 2 - Essential File Management Tools

### 2.1 - Introducing The Linux File System Layout & FHS

 A typical Linux system has a bunch of default directories that are defined by the **....**
##### File system Hierarchy Standard :-  
- **"/"** The root directory is the start of the entire file system .
- **"/boot"** is a directory that contains the kernal and the initramfs , 
which are responsible for booting your system.
- **"/bin"** is a directory that contains executable programs & commands that belong to normal users.
- **"/sbin"** is a directory that contains system binaries/commands which require root privileges.
- **"/lib,/lib64"** essential libraries/dependencies for the binaries in /sbin and /bin.
- **"/home"** is for users home directories and files.
- **"/proc"** this is a mount point for the proc file system , which provides info about the kernal and the    running processes.
- **"/var/"** this directory contains log , cache , and backup files a couple of useful sub-dirs
- `man hier` to read more  about FHS.
 
### 2.2 - Essential File Management Tasks
```bash
   ls    # List files and directories in the current directory.
   ls -l /dir # Long listing option to show extra info about the files.
   ls -i # List files and show the Inode for each file.
   ls -a # Show hidden files , any file that starts with a dot.
   ls -lah # Long list , show hidden files, & make the sizes readable by humans.
   ls -lrt # Long list , and sort files based on the modification time.
   mkdir myDir # Create a new directory 
   mkdir -p ~/this/is/a/path # Create a whole path using the -p flag
   touch myFile.js file.cpp pfile.py # Create a file or multiple files.
   rmdir emptyDir # Remove an empty directory. (not very useful)
   rm file # Remove/Delete a file.
   rm -r directory # Delete a whole directory with the recursive -r option.
   cp original.txt copy.txt  #  Copy files from the source to the destination "." .
   cp -r directory/ ../dir/  # Recursively copy the directory to another dir.
   mv file ../../renamed-file  # Move or/and rename a file.
   mv directory/ newDir/ # Rename or/and Move a directory.
```

### 2.3 -  Finding Files with `find`
- The `find` command is a powerful tool ,that  allows us to search the
  linux file system for files/dirs that meet a certain criteria and we 
  can perform actions / pipes on the result we get back.

- Finding files/dirs based on their **name & size**
```bash
find /directory -type d -size +500M # to find directories inside directories.
find /myDir -type f # to find files inside directories.
find /etc -size +200M # (files over 200MB) to find a file based on its size.
find . -empty # to find all empty files in the current directory.
find / -type f -name '*.js' # wildcards are allowed
```
- Finding files/dirs based on their  **metadata & permissions** 
```bash
   find ~ -type f -mtime -2  # (modified files in the last 2 days)
   find . -type f -amin -45 # (accessed  45-mins ago)
   find /etc -type f -ctime +3 # (changed more than 3 days ago)
   find . -perm 777 # find all files with read/write/execute permissions or 777
```
- Executing commands/pipes on `find`'s result.
```bash
 # Find all files with perms 777 and change them to 775.
 find . -perm 777 -exec chmod 775 {} \;
 # Find files , create a new directory & then copy the result to the new dir
 find . -type f -perm 777 -exec mkdir -p ../newDir \; -exec cp {} ../newDir/ \;
 # Find files with globbing & move them to a new directory. (multiple execs)
 find . -type f -name *.css -exec mkdir -p newDir \; -exec mv {} newDir/ \;
 # Find files based on their name using wildcards , and pipe the result to less
 find /etc -name s* -type f | less

```
### 2.4 - Hard vs Symbolic Links in Linux 
#### Hard drive structure in a UNIX system and the concept of Inodes :-
- On a typical unix system a hard drive is divided into **3** different parts.
   - **The Super Block** contains info about the file system.(type,size,status..)
   - **The Inode Table** and each Inode contains :-
      - Info about the files in your system .
      - Mode/permissions , size & ownership .
      - Timestamp of the file (**c** => changed,**a** => acessed,**m** => modified).
      - Data Block which contains pointers to the actual data blocks.
   - **Data Blocks** which store the actual data not a reference or a pointer.
      - Every block has one or several Inodes pointing to it
- In some cases data can be recovered because when you delete a file the 
Inode pointer gets unlinked from the data block and the data stays in
disk until it gets overwritten.

##### Soft Links :-

- Soft Links are similar to C++ pointers because they share some features.
   - One file can have multiple soft links , or multiple pointers can 
    point at the same file or node. 
   - Changes made to the soft link will be applied to the original file.
   - When a soft link is deleted , the original file stays intact.
   - When a file is deleted any soft link pointing to that file will point
   to null or nothing (the link/pointer becomes a hanging link )
- Soft links can be linked across different file systems.
##### Hard Links :-
- Hard Links are similar to C++ references because ....
   - Each hard linked file is assigned the same Inode value as the original
   , therefore they reference the same physical file location.
   - Hard links have the content of the orignal file.   
-  Removing a hard link, reduces the link count, but the original file
   stays intact (ls -li).

### 2.5 - Archiving and Compressing files in Linux.
- Archiving vs Compressing
   - Archiving is creating a single file that contains a list of files.
   - Compression is using some advanced algorithms to look for patterns
     , and that usually makes the file smaller in size .
- Tar is a powerful command from the 1970's and it stands for tape archive
because tapes were the only way of archiving anything .
#### Important flags/options for `tar` :-
- `-c`   ~> Create a new archive.
- `-v`   ~> Verbosely list files processed.
- `-f`   ~> Specify a file/archive name.
- `-x`   ~> Extract all files in an archive.
- `-t`   ~> List all files in an archive.
- `-C`   ~> Change to a directory before extracting.
- `-z`   ~> Use gzip to compress the archive.
- `-j`   ~> Use bzip2 to compress the archive.
- Tar common use cases.
```bash
   tar -cvf Archive.tar /dir # Create an archive.
   tar -tvf Archive.tar # Check the content/validity of an archive.
   tar -xvf Archive.tar # Extract files in the current directory.
   tar xvf Archive.tar -C /etc # Extract files in a specific directory
```
##### Compression tools :-
- The generic `zip` utility  offers a high level of compatibility with other operating systems.
- `gzip` has been the default in linux for a long period of time .
- `bzip2` is a newer compression utility with faster algorithms.
- The two most common compression utilities are `bzip2` and `gzip`.
```bash
   gzip File # To compress a file using gzip. 
   gunzip File.gz # To uncompress a gzip file.
   bzip2 File # To compress a file using bzip2 which is faster.
   bunzip2 File.bz2 # To uncompress a bzip2 compressed file.
   # Using tar to archive and [bzip2|gzip] to compress a file.
   tar czvf comp.tgz /dir # .tar.gz compressed archive with gzip
   tar cjvf comp.tbz /dir # .tar.bz2 compressed archive with bzip2
```

## 3 - Working with Text Files .

### 3.1 - Intro to Regular Expressions 
- Regular Expressions are text patterns that are used by tools like grep
and some other text-processing utilities to find text / strings.
- `grep` , `vim` , `awk` , and `sed` are a couple of powerful utilities that use REGEX .
- Don't confuse regular expressions with wildcards.
- `man 7 regex` to read more about the topic.
- Most common REGEX characters and their meaning.
```bash
# "^"      ~> Beginning/Start of a string.
grep "^abc" file # any string that starts with "abc"
# "$"      ~> End of a string.
grep "abc$" file  #  any string that ends with "abc".
# "."      ~>  One of any Character except the new line.
grep "a.c" file    # "a(any char)c".
# "|"      ~> Alteration , OR operator.
grep "^c|b" file  # Any string that starts with "c" or "b".
# "{}"     ~> Refers to the explicit quantity of the preceding char.
grep "^a{2}" file  # any string that starts with 2 (a)s .
# "[]"     ~> Explicit set of characters to match .
grep "[ab]$" file  # any string that ends with "a|b".
# "()"     ~> Group of characters.
grep "(ab){2}^" file # any string that starts with "abab".
# "*"      ~> Null or more of the preceding character.
grep "ab*c" file    # "ac" "abc" abbc" abbbbbbbbbc" 
# "+"      ~> One or more of the preceding character.
grep "ab+c" file   # the string must have at least 1 b.
# "?"      ~> Null or one of the preceding character (optional char).
grep "a?c*" file    # any string that ends with "ac|c".
# "-v"     ~> Invert the match , this works like the "!" negation operator
grep -v "^#" /etc/ssh/ssh_config # everything that doesn't start with a # 
```
### 3.2 - Common Text Tools

```bash
# print out the contents of "passwd".
cat /etc/passwd # each line has a bunch of fields that are divided by a ":".
tac /etc/passwd # print out the content of "passwd" starting from the bottom.
# print the first field from each line that is divided by a ":"  in "passwd"
cut -f 1 -d ":" /etc/passwd 
# sort & cut are two convenient tools that might require some additional reading.
cut -f 1 -d ":" passwd | sort  # sort the output in an alphabetical order.
cut -f 3 -d ":" passwd | sort -n # sort the output in a numerical order.
head passwd # by default it shows the first 10 lines in a file.
head -n 2 passwd # -n option to specify the number of lines.
tail -n 5 passwd # show the last 5 lines of passwd.
# tail can used to monitor the most important log file in a linux system.
tail -f "/var/log/messages" # -f option is to freshen the output 
cat file | tr [a-z] [A-Z] # translate all lower case to upper case 
```
### 3.3 - Intro to openssh and sudo :-

- There are 2 different types of users on a linux system.
   - **root** user which is the god user that has the ability to do everything on the system.
   - **normal** users have limited access to the linux system.
- It is always recommanded to login as a normal user and use `sudo` to gain root privileges
- `su -` or `sudo -i` to open a root shell which is a limited risk.
- `su - user` root has the power to open a shell as any user without typing the password.
- `su -` doesn't work on ubuntu because by default it doesn't ask for a root password.
   - `sudo -i` to open a root shell using **sudo**

## 4 - Managing Users & Groups

### 4.1 - Introducing `useradd` & `adduser`

- Managing users & groups in a linux system is important because :-
   - Users allow **people** to connect to your system and perform specific tasks.
   - User accounts are not just about people because in many cases you will find servers that don't have any users loging in but there will be some **system accounts** with specific permissions that will allow certain processes to use a restricted amount of resources.
   - Users & Groups can be **owners** of files and directories & every file/dir has an owner.
- **adduser** is a perl script that is available in some distros that uses `useradd` with prompts
- adduser is an interactive way of creating new users and it can also add a user to a group


 ##### A couple of useful options to use ,`sudo useradd --help | less ` :-
- `-c` | `--comment` add a specific description of the new user.
- - `-e` | `--expiredate` specify an expiration date.
- - `-g` | `--gid` specify the primary group of the new user & by default a group will be created with the same user's name.
- `-G`| `--groups` specify a list of supplementary groups.
- `-m` create the user's home directory which is not automated in some distros.
- `-s` specify the default shell for the user.
- `-u` specify the new user's id or it will be generated automatically.


##### Useful Commands related to user creation & password configuration
```bash
su - # open a root shell
useradd -c "some description" -s /bin/zsh -m koala # create a new user
passwd # change the password if you are loged as a normal user.
echo password | passwd --stdin user # take the password from standard input.
passwd -d koala # delete a password or -e to expire a password 
passwd -l koala # lock a password  or -u to unlock it.
# chage is used to change a password's properties interactively
id # shows current user's id , primary group , and supplementary groups , etc..
id "koala" # you can specify a user without root privileges.
groups # show current user's groups
groups "koala" # show a specific user's groups
cut -d: -f1 /etc/group | sort # list all groups in the system alphabetically.
# when a user creates a file , the user and his primary group become the owners.
touch file.py
ls -l # Long list the files/dirs which will show the "ownership" of the file/dir
   -rw-rw-r--. 1 koala koala 0 Jul  3 08:47 file.py
   # perms       (user)(group)
sudo adduser koala sudo # add the user "koala" to the "sudo" group
sudo usermod -aG annaba koala # add "koala" to the "annaba" group
# the -aG option appends the group annaba to the supplementary groups of koala
# usermod is a command that is typically used to modify a user's properties
sudo usermod -L koala # Lock a user and prevent him/her from loging in.
sudo usermod -U koala # Unlock a user account
sudo userdel -rf koala # Force delete a user and delete her/his home directory.
# when you create a user its written to two configuration files :-
# /etc/passwd is where you will find information related to users
sudo vipw # to edit this file using vim
# /etc/shadow contains hashed passwords and information related to users' passwords
```
#### Configuring Defaults for Creating Users :-
```bash
su - # open a root shell or sudo -i if the user is in the sudoers file
useradd -D # prints out the default parameters when creating a new user
   GROUP=100  # Group ID 
   HOME=/home # The location where home dirs will be created
   INACTIVE=-1 # The user account won't be active after creation
   EXPIRE=  # The user won't expire after creation
   SHELL=/bin/bash # Default shell environment
   SKEL=/etc/skel # The contents of this dir will be copied to the user's home dir 
   CREATE_MAIL_SPOOL=yes #create a mail dir which will allow the user to send emails
sudo vim "/etc/default/useradd" # Edit user creation defaults
sudo vim /etc/login.defs # Additional configuration for user creation like :-
# the location of the mail spool and settings related to passwords,users & groups 
useradd -c "some description" -s /bin/zsh -m koala # create a new user
  ```

### 4.2 - Creating Groups with `groupadd`
```bash
# -g|--gid option to specify a group ID or it will be auto-generated.
sudo groupadd -g 1997 annaba # create a new group
groups #  list all existing groups
# add an existing user to an existing group by using `usermod` or `adduser`
sudo adduser koala annaba # add "koala" to the "annaba" group 
sudo groupdel annaba # Delete a group
# group configuration file is /etc/group
cut -d : -f1 /etc/group | sort # check by listing all groups in the system .
sudo groupmod -n Annaba annaba # change a group's name or any group property.
```

### 4.3 - Remote Authentication in Linux

- In Remote Auth we keep the usernames and passwords on a server.
   - AD : windows active directory if you are using windows
   - LDAP server which is common on linux.
- By default,the login utility will look for user credentials in **/etc/passwd**
- **PAM** stands for pluggable Auth Modules which made connecting to other Auth sources easier in Linux.
- The login utility is PAM aware so we can create a config that will redirect logins to the Auth server.
----
## 5 - Managing Linux Permissions and Quota
### 5.1 - An Intro to Linux permissions.

- Linux permissions were developed in the early 1970's , so they were designed for trusted environments because external security threats like the internet and remote computing didn't exist.
- Linux has to check file/dir ownership to determine a user's permissions
- Every file/dir in Linux has a **u**ser owner , **g**roup owner , and **o**ther owners. 
- The basic Linux permissions are :-
   - **Read < 4 >** permits us to read files , or list files in a directory.
   - **Write < 2 >** permits us to modify files , create or delete files in a directory. 
   - **Execute < 3 >** permits us to execute scripts or `cd` in a directory.
