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
    sudo groupdel badgroup
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
    password: 
    ```
13. Try to access (by cd command) the folder (myteam)

    ```
    cd /home/username/myteam
    #/home/username/myteam: Permission denied
    ```
14. Using the command Line
    Change the permissions of oldpasswd file to give owner read and write permissions and for group write and execute and execute only for the others (using chmod in 2 different ways)
    change your default permissions to be as above.

    ```
    chmod 631 oldpasswd
    chmod u=rw,g=wx,o=x oldpasswd
    ```
15. What is the maximum permission a file can have, by default when it is just created? And what is that for directory.

    ```
    file: he maximum permissions a file can have when it is created are 666 (octal), which translates to -rw-rw-rw- (no execute)
    directory: the maximum permissions a directory can have when it is created are 777 (octal), which translates to drwxrwxrwx
    ```
16. Change your default permissions to be no permission to everyone then create a directory and a file to verify.

    ```
    umask 777
    touch test2
    mkdir test3
    ls -al
    ---------- 1 liveuser liveuser   0 Jul 10 18:20 test2
    d--------- 2 liveuser liveuser  40 Jul 10 18:21 test3
    ```
17. What are the minimum permission needed for:
    a. Copy a directory (permission for source directory and permissions for target parent directory)
    b. Copy a file (permission for source file and and permission for target parent directory)
    c. Delete a file
    d. Change to a directory
    e. List a directory content (ls command)
    f. View a file content (more/cat command)
    g. Modify a file content

    ```
    Copy a directory :
    	Source directory: r-x
    	Target parent directory: wx

    Copy a file:
        Source file: r
        Target parent directory: wx

    Delete a file:
        Parent directory of the file: wx

    Change to a directory:
        Directory to be accessed: x

    List directory content:
        Directory to be listed: r-x

    View a file content:
        File to be viewed: r

    Modify a file content:
        File to be modified: rw
    ```
18. Create a file with permission 444. Try to edit in it and to remove it? Note what happened.

    ```
    touch testfile
    chmod 444 testfile
    vi testfile
    # insert mode and write anything
    permission denied
    ```
19. What is the difference between the “x” permission for a file and for a directory?

    ```
    file: it means the file can be executed as a program or script. This allows the user to run the file as a command.
    directory: it means the user can enter (cd into) the directory and access its contents (if they also have the read permission).
    ```
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
    sh:
    	/etc/profile: This is a system-wide initialization file executed for login shells.
    	~/.profile: This is the user-specific initialization file executed for login shells.
    ksh:
    	/etc/profile: This is a system-wide initialization file executed for login shells.
       	~/.profile: This is the user-specific initialization file executed for login shells.
       	~/.kshrc: This is the user-specific initialization file executed for interactive shells (not just login shells). This file is typically used for shell-specific settings and functions.
    bash:
    	Login shells:
    		/etc/profile: This is a system-wide initialization file executed for login shells.
    		~/.bash_profile: This is the user-specific initialization file executed for login shells.
    		~/.bash_login: This file is read if ~/.bash_profile is not found.
    		~/.profile: This file is read if ~/.bash_profile and ~/.bash_login are not found.
    	non-login shells:
    		~/.bashrc: This is the user-specific initialization file executed for interactive non-login shells. This file is commonly used for shell-specific settings and functions.
    	non-Interactive shells:
    		When a script is executed, the shell does not typically read any of the above initialization files. However, if the script explicitly sources them, they will be read.
    	all shells:
    		~/.bash_logout: This file is executed when a login shell exits.
    ```
28. Edit in your profile to display date at login and change your prompt permanently.

    ```
    #edit bash_profile for changes at login
    nano ~/.bash_profile
    #insert the following line, save and exit the file
    echo "Welcome! Today's date is $(date)" 

    Welcome! Today's date is Wed Jul 10 06:41:39 PM EEST 2024
    [liveuser@eos-2024.04.20 ~]$ 

    #edit bashrc file for permanent change
    nano ~/.bashrc
    #PS1 variable. If it doesn't exist, you can add it. Customize the prompt as needed.
    PS1="[\u@$iso_info \W \h]\$ "
    #username (\u), hostname (\h), and current working directory (\w)
    [liveuser@eos-2024.04.20 ~ EndeavourOS]$ 
    ```
29. Execute the following command :
    echo \ then press enter
    What is the purpose of \ ?
    Notice the prompt ”>” what is that? and how can you change it from “>” to “:”. (Search PS1, PS2, ...)

    ```
    When you type echo \ and press Enter, the backslash escapes the newline character that normally signifies the end of the command. This tells the shell that the command continues on the next line in PS2.

    to change PS2 from > to :
    1.temporary: export PS2=':' in terminal
    2.permenant: add export PS2=':' in .bashrc 
    ```
30. Create a Bash shell alias named ls for the “ls –l” command

    ```
    vi ~/.bahrc
    --insert mode add the following line
    alias ls='ls -l'
    --exit and save with :wq!
    . ~/.bashrc
    ```
