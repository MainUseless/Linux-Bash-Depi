1. Create a user account with the following attribute
   Username: xxxx
   Fullname/comment: xxx xxx
   Password: xxxxx
   ```
   sudo useradd  -m  -c "xxx xxx" xxxx
   passwd xxxx
   : xxxxx
   ```
2. Create a user account with the following attribute
   Username: baduser
   Full name/comment: Bad User
   Password: baduser
   ```
   sudo useradd  -m  -c "Bad User" baduser
   passwd baduser
   : baduser
   ```
3. Create a supplementary (Secondary) group called pgroup with group ID of 30000

```
sudo groupadd -g 30000 pgroup
```

4. Create a supplementary group called badgroup

   ```
   sudo groupadd pgroup
   ```
5. Add islam user to the pgroup group as a supplementary group

   ```
   sudo usermod -aG pgroup islam
   ```
6. Modify the password of islam's account to password

   ```
   passwd islam
   : --new password--
   ```
7. Modify islam's account so the password expires after 30 days

   ```
   sudo chage -M 30 islam
   ```
8. Lock bad user account so he can't log in

   ```
   sudo passwd -l baduser
   ```
9. Delete bad user account

   ```
   sudo userdel baduser
   ```
10. Delete the supplementary group called badgroup.

    ```
    usdo groupdel badgroup
    ```
11. Create a folder called myteam in your home directory and change its permissions to
    read only for the owner.

    ```
    mkdir ~/myteam
    chmod 400 ~/myteam
    ```
12. Log out and log in by another user

    ```
    exit
    su - otherusername
    ```
13. Try to access (by cd command) the folder (myteam)

    ```
    cd /home/username/myteam
    /home/username/myteam: Permission denied
    ```
14. Using the command Line
    Change the permissions of oldpasswd file to give owner read and write permissions and for group write and execute and execute only for the others (using chmod in 2 different ways)
    change your default permissions to be as above.
15. What is the maximum permission a file can have, by default when it is just created? And what is that for directory.
16. Change your default permissions to be no permission to everyone then create a directory and a file to verify.
17. What are the minimum permission needed for:
    Copy a directory (permission for source directory and permissions for target parent directory)
    Copy a file (permission for source file and and permission for target parent directory)
    Delete a file
    Change to a directory
    List a directory content (ls command)
    View a file content (more/cat command)
    Modify a file content
18. Create a file with permission 444. Try to edit in it and to remove it? Note what happened.
19. What is the difference between the “x” permission for a file and for a directory?
20. Using vi write your CV in the file mycv. Your CV should include your name, age, school, college, experience,...
21. Open mycv file using vi command then: Without using arrows state how to:
    Show all lines numbers
    Search for word age
    Step to line 5 (assuming that you are in line 1 and file is more than 5 lines).
    Delete the line you are on and line 5.
22. List the available shells in your system.

    ```
    cat /etc/shells
    # pathnames of valid login shells
    /bin/sh
    /bin/bash
    /sbin/nologin
    /bin/dash
    /usr/bin/zsh
    ```
23. List the environment variables in your current shell.

    ```
    echo $SHELL
    /bin/bash
    ```
24. List all of the environment variables for the bash shell.

    ```
    env
    SHELL=/bin/bash
    SESSION_MANAGER=local/EndeavourOS:@/tmp/.ICE-unix/530,unix/EndeavourOS:/tmp/.ICE-unix/530
    WINDOWID=58720280
    .....
    ```
25. What are the commands that list the value of a specific variable?

    ```
    echo $PATH
    env | grep -i PATH (Case insensitive)
    printenv PATH (Case sensitive)
    ```
26. Display your current shell name.

    ```
    echo $SHELL
    /bin/bash
    ```
27. State the initialization files of: sh, ksh, bash.

    ```

    ```
28. Edit in your profile to display date at login and change your prompt permanently.

    ```

    ```
29. Execute the following command :
    echo \ then press enter
    What is the purpose of \ ?
    Notice the prompt ”>” what is that? and how can you change it from “>” to “:”. (Search PS1, PS2, ...)
30. Create a Bash shell alias named ls for the “ls –l” command

    ```
    vi ~/.bahrc
    --insert mode add the following line
    alias ls='ls -l'
    --exit and save with :wq!
    . ~/.bashrc

    ```
