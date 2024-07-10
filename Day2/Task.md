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
5. Save the output of the last command sorted by their full names in a file.
6. Write two commands:
   first: to search for all files on the system that named .bash_profile.
   Second: sorts the output of ls command on / recursively, Saving
7. their output and error in 2 different files and sending them to the background.
8. Display the number of users who is logged now to the system.
9. Display lines 7 to line 10 of /etc/passwd file

   ```
   head -n 10 /etc/passwd | tail -n 4
   ```
10. What happens if you execute:
    cat filename1 | cat filename2
    ls | rm
    ls /etc/passwd | wc –l
11. Issue the command sleep 100.

    ```
    sleep 100
    ```
12. Stop the last command.

    ```
    ctrl + z
    [3]+  Stopped                 sleep 100
    ```
13. Resume the last command in the background

    ```
    bg %3
    [3]+ sleep 100 &
    ```
14. Issue the jobs command and see its output.

    ```
    jobs
    [1]-  Stopped                 sleep 100
    [2]+  Stopped                 sleep 100
    [3]   Running                 sleep 100
    ```
15. Send the sleep command to the foreground and send it again to the background.

    ```
    fg %3
    sleep 100
    ctrl + z
    [3]+  Stopped                 sleep 100
    bg %1
    [3]+ sleep 100 &
    ```
16. Kill the sleep command.

    ```
    ps
        PID TTY          TIME CMD
       1833 pts/1    00:00:00 bash
       1898 pts/1    00:00:00 sleep
       1899 pts/1    00:00:00 ps
    kill 1898
    [1]+  Terminated              sleep 100
    ```
17. Display your processes only

    ```
    ps -u test1234
        PID TTY          TIME CMD
       1833 pts/1    00:00:00 bash
       1904 pts/1    00:00:00 ps
    ```
18. Display all processes except yours

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
19. Use the pgrep command to list your processes only
20. Kill your processes only.
21. Compress a file by compress, gzip, zip commands and decompress it again. State the
22. differences between compress and gzip commands.
23. What is the command used to view the content of a compressed file.
24. Backup /etc directory using tar utility.
25. Starting from your home directory, find all files that were modified in the last two day.
26. Starting from /etc, find files owned by root user.

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
27. Find all directories in your home directory.

    ```
    ls -d ~/*/
    /home/liveuser/Desktop/    /home/liveuser/Downloads/  /home/liveuser/Pictures/  /home/liveuser/Templates/
    /home/liveuser/Documents/  /home/liveuser/Music/      /home/liveuser/Public/    /home/liveuser/Videos/
    ```
28. Write a command to search for all files on the system that, its name is “.profile”.

    ```
    find / -type f -name ".profile"
    ```
29. Identify the file types of the following: /etc/passwd, /dev/pts/0, /etc, /dev/sda
30. List the inode numbers of /, /etc, /etc/hosts.
31. Copy /etc/passwd to your home directory, use the commands diff and cmp,
    and Edit in the
    file you copied,
    and then use these commands again, and check the output.
32. Create a symbolic link of /etc/passwd in /boot.
33. Create a hard link of /etc/passwd in /boot. Could you? Why?
