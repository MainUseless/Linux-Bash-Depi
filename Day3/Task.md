LABS3:

1. Create a script that asks for user name then send a greeting to him.

   ```
   #!/bin/bash
   echo -n "enter yo name: "
   read name
   echo -n "greetings $name"
   ```
2. Create a script called s1 that calls another script s2 where:
   a. In s1 there is a variable called x, it's value 5

   ```
   #!/bin/bash
   x=5
   export x
   sh s2.sh $x
   ```
3. b. Try to print the value of x in s2 by two different ways.

   ```
   #!/bin/bash
   echo $1
   echo $x
   ```
4. Create a script called mycp where:
   a. It copies a file to another
   b. It copies multiple files to a directory.

   ```
   #!/bin/bash
   cp $@
   ```
5. Create a script called mycd where:
   a. It changed directory to the user home directory, if it is called without arguments.
   b. Otherwise, it change directory to the given directory.

   ```
   #!/bin/bash
   if [ $# -eq 0 ]; then
       cd $HOME
   else
       cd $@
   fi

   call it with source or . like : . mycd.sh | source mycd.sh
   ```
6. Create a script called myls where:
   a. It lists the current directory, if it is called without arguments.
   b. Otherwise, it lists the given directory.

   ```
   #!/bin/bash
   ls $@
   ```
7. Enhance the above script to support the following options individually:
   a. –l: list in long format
   b. –a: list all entries including the hiding files.
   c. –d: if an argument is a directory, list only its name
   d. –i: print inode number
   e. –R: recursively list subdirectories

   ```
   still works :)
   ```

---

1. Write a script called mycase, using the case utility to checks the type of character

entered by a user:
    a. Upper Case.
    b. Lower Case.
    c. Number.
    d. Nothing.

2. Enhanced the previous script, by checking the type of string entered by a user:
   a. Upper Cases.
   b. Lower Cases.
   c. Numbers.
   d. Mix.
   e. Nothing.
3. Write a script called mychmod using for utility to give execute permission to all files and
   directories in your
   home directory.
4. Write a script called mybackup using for utility to create a backup of only files in your home directory.
5. Write a script called mymail using for utility to send a mail to all users in the system.
   Note: write the mail body in a file called mtemplate.
6. Write a script called chkmail to check for new mails every 10 seconds. Note: mails are saved in /var/mail/username.

---

**Using sed utility**

1. Display the lines that contain the word “lp” in /etc/passwd file.
2. Display /etc/passwd file except the third line.
3. Display /etc/passwd file except the last line.
4. Display /etc/passwd file except the lines that contain the word “lp”.
5. Substitute all the words that contain “lp” with “mylp” in /etc/passwd file.

---

**Using awk utility**

1. Print full name (comment) of all users in the system.

   ```
   [liveuser@eos-2024.04.20 temp]$ awk -F: '{print $5}' /etc/passwd

   root





   Kernel Overflow User
   System Message Bus
   systemd Core Dumper
   systemd Network Management
   systemd Userspace OOM Killer
   ....
   ```
2. Print login, full name (comment) and home directory of all users.( Print each line preceded by a line number)

   ```
   [liveuser@eos-2024.04.20 temp]$ awk -F: '{print NR " " $1  " " $5" " $6}' /etc/passwd
   1 root root /root
   2 bin  /
   3 daemon  /
   4 mail  /var/spool/mail
   5 ftp  /srv/ftp
   6 http  /srv/http
   7 nobody Kernel Overflow User /
   8 dbus System Message Bus /
   9 systemd-coredump systemd Core Dumper /
   ....
   ```
3. Print login, uid and full name (comment) of those uid is greater than 500
4. Print login, uid and full name (comment) of those uid is exactly 500
5. Print line from 5 to 15 from /etc/passwd
6. Change lp to mylp
7. Print all information about greatest uid.
8. Get the sum of all accounts id’s.
