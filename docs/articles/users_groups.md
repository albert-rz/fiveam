# Users and groups in Linux

Managing users and groups is an essential task for system administrators, who have to ensure that the system is secure and runs smoothly. This also includes software engineers working with Dockerfiles.

In this blog post, we'll cover the basics of user and group management in Linux.

## Current user

The `whoami`, `groups` and `id` commands can be used to get information about the current user in Linux.

`whoami` simply returns the username of the current user, while `groups`  displays the names of the groups that the user is a member of:

```bash
$ whoami
albert-rz
$ groups
albert-rz sudo
```

`id` provides more detailed information about the current user, including the user ID (UID), group ID (GID), and any supplementary group IDs:

```bash
$ id
uid=1000(albert-rz) gid=1000(albert-rz) groups=1000(albert-rz),27(sudo)
```

## Display all users and groups

Users and groups are saved in the `/etc/passwd` and `/etc/group` files, respectively. You can extract this informatino with `cut`:

```
$ cut -d : -f 1 /etc/passwd
```

and:

```bash
$ cut -d : -f 1 /etc/group
```

## Add

`useradd` is used to create new user accounts. As an example, The command below will add a new user named "albert-rz":

```bash
$ useradd -s /bin/bash -m -G sudo max
```

Where:

* `-s /bin/bash` - Set `/bin/bash` as login shell fo the new account.
* `-m` - Create user's home directory.
* `G sudo` - Allow the new user to sudo.

The `chpasswd` command can be used to modify a user's password:

```
$ echo 'max:new_password' | chpasswd
```

Finally, we can log in as the new user and access the home directory.

```bash
$ su - max
```

The equivalent command for groups is `groupadd`.

## Delete

Accounts can be deleted with `userdel`. As an example, the command below will delete a user named "max" and the its home directory:

```bash
$ userdel -r max
```

The equivalent command for groups is `groupdel`.

## Modify

After creating an account, `usermod` enables you to modify the user's home directory, group membership, shell, or login value.

The example below demonstrates how to use usermod. First, we create a user named "max" along with their home folder and some files.

```bash
$ useradd -m max
$ ls -la /home/max
$ su - max
$ touch hello.txt
$ exit
```

Then, we change the login value to "john", create a new home folder for the user, and transfer their files to it. Finally, we reassign the user to a new group and add it to sudo list.

```
$ usermod -l john -m -d /home/john max
$ groupadd john
$ usermod -g john -aG sudo john
$ ls -la /home/john
total 20
drwxr-x--- 2 john john 4096 Mar 18 17:07 .
drwxr-xr-x 1 root root 4096 Mar 18 17:08 ..
-rw-r--r-- 1 john john  220 Jan  6  2022 .bash_logout
-rw-r--r-- 1 john john 3771 Jan  6  2022 .bashrc
-rw-r--r-- 1 john john  807 Jan  6  2022 .profile
-rw-rw-r-- 1 john john    0 Mar 18 17:07 hello.txt
```