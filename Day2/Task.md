1. List the user commands and redirect the output to /tmp/commands.list

   ```
   history > /tmp/commands.list
   ```
2. Count the number of user commands

   ```
   history | wc -l
   ```
3. Get all the users names whose first character in their login is ‘g’.

   ```
   cat /etc/passwd | grep -ie "^g"

   geoclue:x:972:972:Geoinformation service:/var/lib/geoclue:/usr/bin/nologin
   git:x:971:971:git daemon user:/:/usr/bin/git-shell
   ```
4. Get the logins name and full names (comment) of logins starts with “g”.

   ```
   [liveuser@eos-2024.04.20 ~]$ getent passwd | grep '^g' | awk -F: '{print $1, $5}'
   geoclue Geoinformation service
   git git daemon user
   ```
5. Save the output of the last command sorted by their full names in a file.

   ```
   [liveuser@eos-2024.04.20 ~]$ getent passwd | grep '^g' | awk -F: '{print $1, $5}' | sort -k2 > sorted
   [liveuser@eos-2024.04.20 ~]$ cat sorted
   geoclue Geoinformation service
   git git daemon user
   ```
6. Write two commands:
   first: to search for all files on the system that named .bash_profile.
   Second: sorts the output of ls command on / recursively, Saving their output and error in 2 different files and sending them to the background.

   ```
   [liveuser@eos-2024.04.20 ~]$ find / -name ".bash_profile" 2> /dev/null
   /etc/skel/.bash_profile
   /home/liveuser/.bash_profile
   /run/archiso/airootfs/etc/skel/.bash_profile
   /run/archiso/airootfs/home/liveuser/.bash_profile

   [liveuser@eos-2024.04.20 ~]$ ls / -R 2> ~/error 1> ~/output &
   [liveuser@eos-2024.04.20 ~]$ cat ~/error | head -n 5
   ls: cannot open directory '/etc/audit/plugins.d': Permission denied
   ls: cannot open directory '/etc/credstore': Permission denied
   ls: cannot open directory '/etc/credstore.encrypted': Permission denied
   ls: cannot open directory '/etc/NetworkManager/system-connections': Permission denied
   ls: cannot open directory '/etc/openvpn/client': Permission denied
   [liveuser@eos-2024.04.20 ~]$ ls / -R 2> ~/error 1> ~/output 
   [liveuser@eos-2024.04.20 ~]$ cat ~/output | head -n 5
   /:
   bin
   boot
   dev
   etc
   ```
7. Display the number of users who is logged now to the system.

   ```
   [liveuser@eos-2024.04.20 ~]$ who | wc -l
   2
   ```
8. Display lines 7 to line 10 of /etc/passwd file

   ```
   head -n 10 /etc/passwd | tail -n 4
   ```
9. What happens if you execute:
   a. cat filename1 | cat filename2
   b. ls | rm
   c. ls /etc/passwd | wc –l

   ```
   [liveuser@eos-2024.04.20 temp]$ echo "testing2" > test2
   [liveuser@eos-2024.04.20 temp]$ echo "testing" > test
   [liveuser@eos-2024.04.20 temp]$ cat test | cat test2
   testing2 # prints the content of the second file only

   [liveuser@eos-2024.04.20 temp]$ ls | rm
   rm: missing operand

   [liveuser@eos-2024.04.20 temp]$ ls /etc/passwd | wc -l
   1 # always 1 because passwd is a file
   ```
10. Issue the command sleep 100.

    ```
    sleep 100
    ```
11. Stop the last command.

    ```
    ctrl + z
    [3]+  Stopped                 sleep 100
    ```
12. Resume the last command in the background

    ```
    bg %3
    [3]+ sleep 100 &
    ```
13. Issue the jobs command and see its output.

    ```
    jobs
    [1]-  Stopped                 sleep 100
    [2]+  Stopped                 sleep 100
    [3]   Running                 sleep 100
    ```
14. Send the sleep command to the foreground and send it again to the background.

    ```
    fg %3
    sleep 100
    ctrl + z
    [3]+  Stopped                 sleep 100
    bg %1
    [3]+ sleep 100 &
    ```
15. Kill the sleep command.

    ```
    ps
        PID TTY          TIME CMD
       1833 pts/1    00:00:00 bash
       1898 pts/1    00:00:00 sleep
       1899 pts/1    00:00:00 ps
    kill 1898
    [1]+  Terminated              sleep 100
    ```
16. Display your processes only

    ```
    ps -u test1234
        PID TTY          TIME CMD
       1833 pts/1    00:00:00 bash
       1904 pts/1    00:00:00 ps
    ```
17. Display all processes except yours

    ```
    ps -du test1234
        PID TTY          TIME CMD
          2 ?        00:00:00 kthreadd
          3 ?        00:00:00 pool_workqueue_release
          4 ?        00:00:00 kworker/R-rcu_g
          5 ?        00:00:00 kworker/R-rcu_p
          6 ?        00:00:00 kworker/R-slub_
    ....
    ```
18. Use the pgrep command to list your processes only

    ```
    pgrep -u $(whoami)
    1314
    1324
    1373
    1376
    1379
    1381
    ....
    ```
19. Kill your processes only.

    ```
    pkill -u $(whoami)
    ```
20. Compress a file by compress, gzip, zip commands and decompress it again. State the differences between compress and gzip commands.

    ```
    Compress with compress:
    	compress filename
    	This creates a file named filename.Z.

    Compress with gzip:
    	gzip filename
    	This creates a file named filename.gz.

    Compress with zip:
    	zip filename.zip filename
    	This creates a file named filename.zip.

    Decompress with uncompress (for .Z files):
    	uncompress filename.Z

    Decompress with gunzip (for .gz files):
    	gunzip filename.gz

    Decompress with unzip (for .zip files):
    	unzip filename.zip

    Differences Between compress and gzip
    	Compression Algorithm:
    		compress: Uses the LZW (Lempel-Ziv-Welch) algorithm.
    		gzip: Uses the DEFLATE algorithm, which is a combination of LZ77 and Huffman coding.

    	Compression Ratio:
    		compress: Generally achieves a lower compression ratio compared to gzip.
    		gzip: Typically achieves a higher compression ratio, making the compressed files smaller than those produced by compress.

    	File Extensions:
    		compress: Produces files with a .Z extension.
    		gzip: Produces files with a .gz extension.

    	Performance:
    		compress: Generally faster but results in larger files.
    		gzip: Generally slower but results in smaller files due to better compression.
    	Usage:
    		compress: An older utility, less commonly used today.
    		gzip: More widely used and supported across various platforms and tools.
    ```
21. What is the command used to view the content of a compressed file.

    ```
    tar -tf "compressed file name"
    ```
22. Backup /etc directory using tar utility.

    ```
    [liveuser@eos-2024.04.20 ~]$ sudo tar -cf "etc" /etc
    ```
23. Starting from your home directory, find all files that were modified in the last two day.

    ```
    find ~ -mtime -2
    /home/mostafahesham
    /home/mostafahesham/.cache
    /home/mostafahesham/.cache/fontconfig
    /home/mostafahesham/.cache/fontconfig/d589a48862398ed80a3d6066f4f56f4c-le64.cache-9
    ....
    ```
24. Starting from /etc, find files owned by root user.

    ```
    sudo find /etc -user root
    etc
    /etc/.pwd.lock
    /etc/ImageMagick-7
    /etc/ImageMagick-7/colors.xml
    /etc/ImageMagick-7/delegates.xml
    /etc/ImageMagick-7/log.xml
    /etc/ImageMagick-7/mime.xml
    ....
    ```
25. Find all directories in your home directory.

    ```
    ls -d ~/*/
    /home/liveuser/Desktop/    /home/liveuser/Downloads/  /home/liveuser/Pictures/  /home/liveuser/Templates/
    /home/liveuser/Documents/  /home/liveuser/Music/      /home/liveuser/Public/    /home/liveuser/Videos/
    ```
26. Write a command to search for all files on the system that, its name is “.profile”.

    ```
    find / -type f -name ".profile" 2>/dev/null
    /etc/skel/.profile
    /home/depi/.profile
    /home/mostafahesham/.profile
    ```
27. Identify the file types of the following: /etc/passwd, /dev/pts/0, /etc, /dev/sda

    ```
    sudo file /etc
    [sudo] password for mostafahesham:   
    /etc: directory

    sudo file /dev/pts/0
    /dev/pts/0: character special (136/0)

    sudo file /etc/passwd
    /etc/passwd: ASCII text

    sudo file /dev/sda
    /dev/sda: block special (8/0)
    ```
28. List the inode numbers of /, /etc, /etc/hosts.

    ```
    ls -id /
    2 /

    ls -id /etc
    1835009 /etc

    ls -id /etc/hosts
    1836365 /etc/hosts
    ```
29. Copy /etc/passwd to your home directory, use the commands diff and cmp, and Edit in the file you copied,
    and then use these commands again, and check the output.

    ```
    cp /etc/passwd ./temp/passwd

    diff ./passwd /etc/passwd

    cmp ./passwd /etc/passwd

    #changing the file

    diff ./passwd /etc/passwd
    1c1
    < root:x:0:0:root:/root:/bin/bash111
    ---
    > root:x:0:0:root:/root:/bin/bash

    cmp ./passwd /etc/passwd
    ./passwd /etc/passwd differ: byte 32, line 1

    ```
30. Create a symbolic link of /etc/passwd in /boot.

    ```
    mostafahesham@OG:~/temp$ ln -s /etc/passwd /boot
    ln: failed to create symbolic link '/boot/passwd': Permission denied
    mostafahesham@OG:~/temp$ sudo !!
    sudo ln -s /etc/passwd /boot
    [sudo] password for mostafahesham:   
    mostafahesham@OG:~/temp$ ls -al /boot/passwd 
    lrwxrwxrwx 1 root root 11 Jul 10 20:31 /boot/passwd -> /etc/passwd
    ```
31. Create a hard link of /etc/passwd in /boot. Could you? Why?

    ```
    ln  /etc/passwd /boot
    ln: failed to create hard link '/boot/passwd' => '/etc/passwd': Operation not permitted
    mostafahesham@OG:~/temp$ sudo !!
    sudo ln  /etc/passwd /boot
    mostafahesham@OG:~/temp$ ls -al /boot/passwd 
    -rw-r--r-- 2 root root 2834 Jul 10 20:36 /boot/passwd
    ```
