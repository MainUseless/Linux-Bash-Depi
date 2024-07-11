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

1. Write a script called mycase, using the case utility to checks the type of character entered by a user:
   a. Upper Case.
   b. Lower Case.
   c. Number.
   d. Nothing.

   ```
   #!/bin/bash
   echo -n "Enter a char:" 
   read chara
   case "${chara:0:1}" in
       [A-Z] ) echo "Uppercase letter";;
       [a-z] ) echo "Lowercase letter";;
       [0-9] ) echo "Number";;
       * ) echo "Nothing";;
   esac
   ```
2. Enhanced the previous script, by checking the type of string entered by a user:
   a. Upper Cases.
   b. Lower Cases.
   c. Numbers.
   d. Mix.
   e. Nothing.
3. Write a script called mychmod using for utility to give execute permission to all files and directories in your home directory.

   ```
   #!/bin/bash

   for file in ~/*; do
       if [ -f "$file" ] || [ -d "$file" ]; then
           chmod +x "$file"
           echo "Added execute permission to: $file"
       fi
   done
   ```
4. Write a script called mybackup using for utility to create a backup of only files in your home directory.

   ```

   ```
5. Write a script called mymail using for utility to send a mail to all users in the system.
   Note: write the mail body in a file called mtemplate.

   ```

   ```
6. Write a script called chkmail to check for new mails every 10 seconds. Note: mails are saved in /var/mail/username.

   ```
   #!/bin/bash

   MAIL_FILE="/var/mail/$USER"
   initial_size=$(stat -c %s "$MAIL_FILE")

   while true; do
       current_size=$(stat -c %s "$MAIL_FILE")
       if [[ $current_size -gt $initial_size ]]; then
           echo "You have new mail!"
           initial_size=$current_size
       fi
       sleep 10
   done
   ```

---

**Using sed utility**

1. Display the lines that contain the word “lp” in /etc/passwd file.

   ```
   [liveuser@eos-2024.04.20 ~]$ sed -n '/lp/p' /etc/passwd
   ```
2. Display /etc/passwd file except the third line.

   ```
   [liveuser@eos-2024.04.20 ~]$ sed '3d' /etc/passwd
   root:x:0:0:root:/root:/usr/bin/bash
   bin:x:1:1::/:/usr/bin/nologin
   mail:x:8:12::/var/spool/mail:/usr/bin/nologin
   ftp:x:14:11::/srv/ftp:/usr/bin/nologin
   http:x:33:33::/srv/http:/usr/bin/nologin
   nobody:x:65534:65534:Kernel Overflow User:/:/usr/bin/nologi
   ....
   ```
3. Display /etc/passwd file except the last line.

   ```
   [liveuser@eos-2024.04.20 ~]$ sed '$d' /etc/passwd
   root:x:0:0:root:/root:/usr/bin/bash
   bin:x:1:1::/:/usr/bin/nologin
   ....
   ```
4. Display /etc/passwd file except the lines that contain the word “lp”.

   ```
   [liveuser@eos-2024.04.20 ~]$ sed '/lp/d' /etc/passwd
   root:x:0:0:root:/root:/usr/bin/bash
   bin:x:1:1::/:/usr/bin/nologin
   daemon:x:2:2::/:/usr/bin/nologin
   mail:x:8:12::/var/spool/mail:/usr/bin/nologin
   ftp:x:14:11::/srv/ftp:/usr/bin/nologin
   http:x:33:33::/srv/http:/usr/bin/nologin
   nobody:x:65534:65534:Kernel Overflow User:/:/usr/bin/nolog
   ....
   ```
5. Substitute all the words that contain “lp” with “mylp” in /etc/passwd file.

   ```
   [liveuser@eos-2024.04.20 ~]$ sed -n 's/\blp\w*/mylp/g' /etc/passwd
   ```

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

   ```
   [liveuser@eos-2024.04.20 temp]$ awk -F: '$3 > 500 {print $1" "$3" "$5}' /etc/passwd
   nobody 65534 Kernel Overflow User
   systemd-coredump 984 systemd Core Dumper
   systemd-network 982 systemd Network Management
   systemd-oom 981 systemd Userspace OOM Killer
   systemd-journal-remote 980 systemd Journal Remote
   systemd-resolve 979 systemd Resolver
   systemd-timesync 978 systemd Time Synchronization
   ....
   ```
4. Print login, uid and full name (comment) of those uid is exactly 500

   ```
   [liveuser@eos-2024.04.20 temp]$ awk -F: '$3 = 500 {print $1" "$3" "$5}' /etc/passwd
   root 500 root
   bin 500 
   daemon 500 
   mail 500 
   ftp 500 
   http 500 
   nobody 500 Kernel Overflow User
   dbus 500 System Message Bus
   systemd-coredump 500 systemd Core Dumper
   ....
   ```
5. Print line from 5 to 15 from /etc/passwd

   ```
   [liveuser@eos-2024.04.20 temp]$ awk 'NR >= 5 && NR <= 15' /etc/passwd
   ftp:x:14:11::/srv/ftp:/usr/bin/nologin
   http:x:33:33::/srv/http:/usr/bin/nologin
   nobody:x:65534:65534:Kernel Overflow User:/:/usr/bin/nologin
   dbus:x:81:81:System Message Bus:/:/usr/bin/nologin
   systemd-coredump:x:984:984:systemd Core Dumper:/:/usr/bin/nologin
   systemd-network:x:982:982:systemd Network Management:/:/usr/bin/nologin
   systemd-oom:x:981:981:systemd Userspace OOM Killer:/:/usr/bin/nologin
   systemd-journal-remote:x:980:980:systemd Journal Remote:/:/usr/bin/nologin
   systemd-resolve:x:979:979:systemd Resolver:/:/usr/bin/nologin
   systemd-timesync:x:978:978:systemd Time Synchronization:/:/usr/bin/nologin
   tss:x:977:977:tss user for tpm2:/:/usr/bin/nologin
   ....
   ```
6. Change lp to mylp
7. Print all information about greatest uid.

   ```
   [liveuser@eos-2024.04.20 ~]$ awk -F':' 'BEGIN { max_uid = 0 } $3 > max_uid { max_uid = $3; user_info = $0 } END { print user_info }' /etc/passwd
   nobody:x:65534:65534:Kernel Overflow User:/:/usr/bin/nologin
   ```
8. Get the sum of all accounts id’s.

   ```
   [liveuser@eos-2024.04.20 temp]$ awk -F':' '{ sum += $3 } END { print sum }' /etc/passwd
   85914
   ```
