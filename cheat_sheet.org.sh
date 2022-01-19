# cheat_sheet.org
# (C) William Hackmore, 2010
# The contents of this file are released under the GNU General Public License. Feel free to reuse the contents of this work, as long as the resultant works give proper attribution and are made publicly available under the GNU General Public License.
# Last updated 8/14/2012
# Best viewed in emacs org-mode.

* Command Reference:
** Basics:
*** Getting help:

# View the manual for target command
man [command]

# Get help with a target command (probably the same as above, but not always):
[command] -h

*** Command Line Utilities:
**** Basic File and Directory Operations:
# Print current working directory:
pwd

# Show files in current directory:
ls

# Show maximum information about all files, including hidden:
ls -a

# Recurse into subdirectories and list those as well:
ls -r
# or
find ./
# or
tree

# Move/rename a file or directory (be careful that you don't move the source over a destination with the same name):
mv [source] [destination]

# Delete target forever (be very careful), use -r recursive flag for directories:
rm [target]

# Copy file or directory:
cp [source] [destination]

# Mount filesytem:
mount /dev/[device name] /path/to/folder

# Unmount:
umount /path/to/folder

# Work with filesystems and partitions. (Easier, still quite dangerous):
fdisk

**** System Administration:

# Execute command as an administrator (dangerous, but necessary for system administration tasks):
sudo [command]

# Become system administrator:
sudo -s

# Quit system administration:
exit

# Ubuntu / Debian
# Check distro repositories for software updates:
sudo apt-get update
sudo apt update

# Download and install updates (update first):
sudo apt-get upgrade
sudo apt upgrade

# Search for package in the repositories:
apt-cache search [keyword]
# or
apt search [keyword]

# Get more detail on one specific package:
apt-cache show [package name]
apt show [package name]

# Download and install a package:
sudo apt-get install [package name]
sudo apt install [package name]

# View the output of a command in a more convenient format:
[command] | less

**** Working With Files:

# Print a file in terminal:
cat [file]

# Find files matching [filename]:
? locate [filename]

# Search through [filename] for matches to [phrase]:
grep [phrase] [filename]

# Search through output of a command for [phrase]:
[command] | grep [phrase]

**** Working With Processes:

# List all running processes:
ps -e

# Standard system monitor showing a more extensive view of all processes and system resources:
top

# Like top, but with a better, cleaner interface:
htop

# Stop a process from using all system resources and lagging computer:
# change process priority, rarely used
nice [process name]

# Kill misbehaving process (use sparingly, last resort, try 'nice' command first):
kill $PID # or kill -15 $PID  # send SIGTERM signal to PID
kill -9 # send SIGKILL signal to PID
pkill [process name] # pattern kill

**** Compression and Encryption:

# Make a simple compressed backup of a file or directory:
# -c create , -v verbose, -z gzip compress, -f [] output file
tar -cvzf output.tgz ./data/*
# .tgz or .tar.gz

# Open a compressed .tgz or .tar.gz file:
# -x extract -v verbose -f file
tar -xvf [target.tgz]

*** The Bash shell:
**** File Name expansions:
# Current user's home directory:
~/ # /home/username/

# Current directory:
./

# Parent directory:
../

# Or even (Two parent directories down):
../../

# All files in target directory. (Be very careful.):
/*

**** Output Redirects:

# Redirect output of one command into the input of another with a pipe:
[command 1] | [command 2]

# Or even:

[command 1] | [command 2] | [command 3]

# Redirect output to a file:
[command] > file

# Or:

[file] > [file]

# Or even, to redirect in a different direction:
[file] < [file]

# Append output rather than writing over the target file:

[file/command] >> [file]

# Works like |, but it writes output to both target and terminal:
cat xxx | tee [target] # sound like T
# or open a new terminal window and
tail -f file

**** Controlling Execution:
# Wait until [command 1] is finished to execute [command 2]
[command 1] ; [command 2]

# Or even:
[command 1] ; [command 2] ; [command 3]

**** Wildcards:
# Zero or more characters:
*

# Matches "phrase" and any number of trailing characters:
phrase*

# Matches any incidences of "phrase" with any trailing or leading chars:
*phrase*

# Matches any one char:
?

# Matches any of the characters listed inside brackets:
[chars] # c or h or a or r or s

# Matches a range of chars between a-z:
[a-z]

** Advanced:
*** Command Line Utilities, Continued:
**** Networking:

# Configure network interfaces:
ifconfig # or ip addr 

# Connect to a remote server.
# ssh: secure shell
ssh user@192.168.1.1

# Copy files over the network from one machine to another:
# ssh copy
scp ./data.zip user@192.168.1.1:/home/user/Download/data.zip

# Copy only changes between files or directories (super efficient way to sync directories, works either locally or with remote servers using username@ipaddress:optionalport, just like ssh):
rsync [source] [target]

# Check to see if target is online and responding
ping [ip address]

# View network route to target:
traceroute6 [ip address]

# Network Monitor
netstat
netstat -an # show port binding
netstat -alpn # show port binding with process name
netstat -rn # show route table

**** Users and Groups:
# Change owner of a file or directory:
chown username:groupname filename
chown username:groupname -R dirname

# Change privileges over file or directory:
chmod a+x file
chmod 755 file
chmod 644 -R dirname

# Create a new user:
useradd

# Change user privileges (be very careful with this one):
usermod

# Delete user"
userdel

# Print groups:
groups

# Create a new group:
groupadd

# Change group privileges:
groupmod

# Delete group:
groupdel

# Temporarily become a different user:
# switch user
su [username]


# Print usernames of logged in users:
users

# View the differences between two files:
diff [file 1] [file 2]

# Output the top -n lines of [file]:
head -n [number of lines] [file]

# Like head, but it outputs the last -n lines:
tail -n number file
tail -f file # follow, watch change

# Call [command] every -n seconds, and display output:
watch -n [number of seconds] [command]

# Execute [command], print how long it took:
time [command]

# View files in home from largest to smallest:
du -a ~/ | sort -n -r | less

# remove spaces from filenames in current directory
rename -n 's/[\s]/''/g' *

# change capitals to lowercase in filenames in current directory
rename 'y/A-Z/a-z/' *

***** Environment and Hardware:
# Print full date and time:
date

# Print the hostname of this machine:
echo $HOSTNAME

# Print information about current linux distro:
lsb_release -a

# Print linux kernel version:
uname -a

**** Python:

# update pip (Python package manager):
pip install -U flask

# search pip repos
pip search django

# create a virtual python environment
python -m venv [dirname]

# connect to a virtual python environment
source [dirname]/bin/activate
. [dirname]/bin/activate

# disconnect from a python environment:
deactivate

# export python virtual environment into a shareable format:
pip freeze > requirements.txt

# import python virtual environment from a requirements.txt file:
pip install -r requirements.txt

**** git (all commands must be performed in the same directory as .git folder):

# Start a new git project:
git init

# Clone a git (target can be specified either locally or remotely, via any number of protocols):
git clone [target]

# Commit changes to a git:
git commit -m "[message]"

# Get info on current repository:
git status

# Show change log for current repository:
git log

# Update git directory from another repository:
git pull [target]

# Push branch to other repository:
git push [target]

# Create a new branch:
git branch [branchname]
git checkout -b [branchname]

# Switch to target branch:
git checkout [branchname]

# Delete a branch:
git branch -d [branchname]

# Merge two branches:
git merge [other branch]

*** mysql/postgresql:

# cli:
mysql
psql

# Get help:
help

# Show databases:
show databases;
\l 

# Choose a database to use:
use [database name here];
\c dataname

# Show database schema:
show tables;
\dt

# Delete database:
DROP DATABASE [databasename];

# New database:
CREATE DATABASE [databasename];

# Create a new user:
CREATE USER [username@localhost] IDENTIFIED BY '[password]' ;
CREATE USER username encrypted password 'password';

# Show users:
select * from mysql.user;
\du

# Delete a user:
delete from mysql.user WHERE User='[user_name]';
DROP USER username;

# Give user access to all tables (make them root). the "%" means that they can sign in remotely, from any machine, not just localhost.:
grant all privileges on *.* to someusr@"%" identified by '[password]';

# give certain privileges to a user on a certain database:
grant select,insert,update,delete,create,drop on [somedb].* to [someusr]@["%"] identified by '[password]';

# Tell mysql to use new user priv policies:
flush privileges;

# mysql command line args:

# export text file with commands to rebuild all mysql tables:

mysqldump [databasename] > backup.sql

# restore from a dump:

mysql -u [username] -p < backup.sql
