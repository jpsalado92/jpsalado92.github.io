---
title: "Play and Learn: A Journey Through the World of Cybersecurity with Bandit@overthewire.org"
date: 2023-01-27 00:00:00 +0100
toc_sticky: true
excerpt: Enhance your cybersecurity skills with this comprehensive guide to Bandit@overthewire.org. Learn how to solve all levels and master this popular platform.
categories: cybersecurity
tags: bandit overthewire bash linux wargames
---

## Introduction

[Bandit@overthewire.org](https://overthewire.org/wargames/bandit/) is a popular platform that provides hands-on experience to learn and improve cybersecurity skills. With its series of challenging Linux-based security problems, it is an excellent place to test your knowledge and expand your understanding of security techniques.

In this post, I will walk through all the levels of `Bandit@overthewire.org` , providing the code I used to reach the solutions for each challenge.

Whether you're an aspiring cybersecurity professional or just looking to improve your skills, this guide will give you a good understanding of the platform and help you unleash your full potential.

## Solving the Wargame

In every level you will find the **Level Goal** followed by some description and the **useful commands** you may use to solve the level between parenthesis (as provided in the original level website).
{: .notice--info}

### [Level 0](https://overthewire.org/wargames/bandit/bandit0.html)

**Level Goal:** The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. The username is bandit0 and the password is bandit0. Once logged in, go to Level 1 page to find out how to beat it. ( `ssh` )

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
password: bandit0
```

### [Level 0 → Level 1](https://overthewire.org/wargames/bandit/bandit1.html)

**Level Goal:** The password for the next level is stored in a file called readme located in the home directory. Use this password to log into bandit1 using SSH. Whenever you find a password for a level, use SSH (on port 2220) to log into that level and continue the game. ( `ls, cd, cat, file, du, find` )

> `ssh bandit0@bandit.labs.overthewire.org -p 2220` with password `bandit0`

```bash
$ ls
readme
$ cat readme
'NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL'
```

### [Level 1 → Level 2](https://overthewire.org/wargames/bandit/bandit2.html)

**Level Goal:** The password for the next level is stored in a file called - located in the home directory. ( `ls, cd, cat, file, du, find` )

> `ssh bandit1@bandit.labs.overthewire.org -p 2220` with password `NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL`

```bash
$ ls
-
$ cat ./-
rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

# Other ways
$ cat /home/bandit1/-
$ cat /home/bandit1/*
$ cat $(pwd)/-
```

> **Key-Takeaways:**
> * Use `*` in the path to apply the same command to multiple targets.
> * Encapsule commands in `$(command)` like structures to concatenate the outputs of the command to other stuff.
{: .notice--success}

### [Level 2 → Level 3](https://overthewire.org/wargames/bandit/bandit3.html)

**Level Goal:** The password for the next level is stored in a file called spaces in this filename located in the home directory. ( `ls, cd, cat, file, du, find` )

> `ssh bandit2@bandit.labs.overthewire.org -p 2220` with password `rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi`

```bash
$ ls
'spaces in this filename'
$ cat spaces\ in\ this\ filename
aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG

# Other ways
$ cat 'spaces in this filename'
$ cat sp*
$ cat *ame
$ cat *this*
$ cat *
```

### [Level 3 → Level 4](https://overthewire.org/wargames/bandit/bandit4.html)

**Level Goal:** The password for the next level is stored in a hidden file in the inhere directory. ( `ls, cd, cat, file, du, find` )

> `ssh bandit3@bandit.labs.overthewire.org -p 2220` with password `aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG`

```bash
$ ls
'inhere'
$ ls inhere/ -la
total 12
drwxr-xr-x 2 root    root    4096 Sep  1 06:30 .
drwxr-xr-x 3 root    root    4096 Sep  1 06:30 ..
-rw-r----- 1 bandit4 bandit3   33 Sep  1 06:30 .hidden

$ cat .hidden
'2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe'
```

### [Level 4 → Level 5](https://overthewire.org/wargames/bandit/bandit5.html)

> `ssh bandit4@bandit.labs.overthewire.org -p 2220` with password `2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe`

**Level Goal:** The password for the next level is stored in the only human-readable file in the inhere directory. Tip: if your terminal is messed up, try the “reset” command. ( `ls, cd, cat, file, du, find` )

```bash
$ file ./inhere/*
./inhere/-file00: OpenPGP Public Key
./inhere/-file01: data
./inhere/-file02: data
./inhere/-file03: data
./inhere/-file04: data
./inhere/-file05: data
./inhere/-file06: data
./inhere/-file07: ASCII text
./inhere/-file08: data
./inhere/-file09: data

$ cat ./inhere/-file07
'lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR'
```

> **Key-Takeaway:** Use the `file` command to display the type of  file(s)
{: .notice--success}

### [Level 5 → Level 6](https://overthewire.org/wargames/bandit/bandit6.html)

> `ssh bandit5@bandit.labs.overthewire.org -p 2220` with password `lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR`

**Level Goal:** The password for the next level is stored in a file somewhere under the inhere directory and has all of the following properties:

* human-readable
* 1033 bytes in size
* not executable

( `ls, cd, cat, file, du, find` )

```bash
# In order to learn more about options
~$ man find | grep size
~$ man find | grep exe
~$ man find | grep readable

$ find . -size 1033c -type f -readable | xargs cat | xargs
'P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU'
```

> **Key-Takeaways:**
>
> * Use `find .` to get every file and folder under a given path.
> * Use `find . -type f` to look for only files.
> * Use `find . -readable` to look for only readable files.
> * Use `find . -size 1033c` to specify the bytes of the file.
> * Use `find . -executable` to look for executable files.
> * Use `!` before an option to complement it.
> * Pipe `xargs` to apply an operation to the output of the previous one. Concatenated removes the spaces of the final output.
{: .notice--success}

### [Level 6 → Level 7](https://overthewire.org/wargames/bandit/bandit7.html)

> `ssh bandit6@bandit.labs.overthewire.org -p 2220` with password `P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU`

**Level Goal:** The password for the next level is stored somewhere on the server and has all of the following properties:

* owned by user bandit7
* owned by group bandit6
* 33 bytes in size

( `ls, cd, cat, file, du, find, grep` )

```bash
# In order to learn more about options

$ man find | grep user
$ man find | grep group
$ man find | grep readable
$ find / -size 33c -user bandit7 -group bandit6 2>/dev/null | xargs cat
'z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S'
```

> **Key-Takeaways:**
>
> * Use `find . -user <USER_NAME>` to look for files owned by a user.
> * Use `find . -group <GROUP_NAME>` to look for files owned by a group.
> * Use `2>/dev/null` to redirect errors to dev null (kind of like a black hole).
> * Use `2>&1` to redirect errors to stdin.
> * Use `>/dev/null 2>&1` to avoid verbosity only redirecting errors to stdin.
{: .notice--success}

### [Level 7 → Level 8](https://overthewire.org/wargames/bandit/bandit8.html)

> `ssh bandit7@bandit.labs.overthewire.org -p 2220` with password `z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S`

**Level Goal:** The password for the next level is stored in the file data.txt next to the word millionth. ( `man, grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd` )

```bash
$ grep '/millionth'/ data.txt | awk '{print $2}'
'millionth TESKZC0XvTetK0S9xNwm25STk5iWrBvP'

# Other way
$ awk '/millionth'/ data.txt | awk '{print $2}'
```

> **Key-Takeaway:** Use `awk '{print $2}'` to print the second argument of the output.
{: .notice--success}

### [Level 8 → Level 9](https://overthewire.org/wargames/bandit/bandit9.html)

> `ssh bandit8@bandit.labs.overthewire.org -p 2220` with password `TESKZC0XvTetK0S9xNwm25STk5iWrBvP`

**Level Goal:** The password for the next level is stored in the file data.txt and is the only line of text that occurs only once. ( `grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd` )

```bash
$ sort data.txt | uniq -u
'EN632PlfYiZbn3PhVK3XOGSlNInNE00t'
```

> **Key-Takeaway:** `uniq -u` takes care of adjacent duplicates, with the `-u` option, it outputs only unique lines
{: .notice--success}

### [Level 9 → Level 10](https://overthewire.org/wargames/bandit/bandit10.html)

> `ssh bandit9@bandit.labs.overthewire.org -p 2220` with password `EN632PlfYiZbn3PhVK3XOGSlNInNE00t`

**Level Goal:** The password for the next level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters. ( `grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd` )

```bash
~$ strings data.txt | grep ==
"========== the
bu========== password
4iu========== is
b~==P
========== G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s"
```

> **Key-Takeaway:** `strings` prints the printable character sequences that are at least 4 characters long (or the number given with the options below) and are followed by an unprintable character.
{: .notice--success}

### [Level 10 → Level 11](https://overthewire.org/wargames/bandit/bandit11.html)

> `ssh bandit10@bandit.labs.overthewire.org -p 2220` with password `G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s`

**Level Goal:** The password for the next level is stored in the file data.txt, which contains base64 encoded data. ( `grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd` )

```bash
$ base64 -d data.txt
'The password is 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM'
```

### [Level 11 → Level 12](https://overthewire.org/wargames/bandit/bandit12.html)

> `ssh bandit11@bandit.labs.overthewire.org -p 2220` with password `6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM`

**Level Goal:** The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions. ( `grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd` )

```bash
$ cat data.txt | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
The password is JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv
```

> **Key-Takeaways:**
> The `tr` command replaces characters according to a specific logic. In this example.
>
> * For upper case cases, we got 13 rotation using. "Map from A-Z to N-ZA-M"
> * For lower case cases, the same was performed by. "Map from a-z to n-za-m"
{: .notice--success}

### [Level 12 → Level 13](https://overthewire.org/wargames/bandit/bandit13.html)

> `ssh bandit12@bandit.labs.overthewire.org -p 2220` with password `JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv`

**Level Goal:** The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!). ( `grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv, file` )

```bash
$ man xxd | grep hexdump
$ cd /tmp
$ mkdir my_test && cd my_test
$ cp ~/data.txt .

# 1st compressed file
$ man xxd | grep hexd
$ xxd -r data.txt > decompressed_data.txt
$ file decompressed_data.txt
'decompressed_data.txt: gzip compressed data, was "data2.bin", last modified: Thu Sep  1 06:30:09 2022, max compression, from Unix, original size modulo 2^32 575'

# 2nd compressed file
$ man gzip | grep decomp
$ cp decompressed_data.txt decompressed_data.gz
$ gzip -d decompressed_data.gz
$ file decompressed_data
'decompressed_data: bzip2 compressed data, block size = 900k'

# 3rd compressed file
$ man bzip2 | grep decomp
$ bzip2 -d decompressed_data
"bzip2: Can't guess original name for decompressed_data -- using decompressed_data.out"
$ file decompressed_data.out
'decompressed_data.out: gzip compressed data, was "data4.bin", last modified: Thu Sep  1 06:30:09 2022, max compression, from Unix, original size modulo 2^32 20480'

# 4th compressed file
$ mv decompressed_data.out decompressed_data.gz
$ gzip -d decompressed_data.gz
$ file decompressed_data
'decompressed_data: POSIX tar archive (GNU)'

# 5th compressed file
$ man tar | grep decomp
$ tar xvf decompressed_data
'data5.bin'
$ file data5.bin
'data5.bin: POSIX tar archive (GNU)'

# 6th compressed file
$ tar xvf data5.bin
'data6.bin'
$ file data6.bin
'data6.bin: POSIX tar archive (GNU)'

# 7th compressed file
$ tar xvf data6.bin
'data8.bin'
$ file data8.bin
$ mv data8.bin data8.gz
$ gzip -d data8.gz
$ file data8
$ cat data8
'The password is wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw'
```

### [Level 13 → Level 14](https://overthewire.org/wargames/bandit/bandit14.html)

> `ssh bandit13@bandit.labs.overthewire.org -p 2220` with password `wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`

**Level Goal:** The password for the next level is stored in `/etc/bandit_pass/bandit14` and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. ( `ssh, telnet, nc, openssl, s_client, nmap` )

```bash
$ ssh bandit14@localhost -p 2220 -i sshkey.private
$ cat /etc/bandit_pass/bandit14
'fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq'
```

### [Level 14 → Level 15](https://overthewire.org/wargames/bandit/bandit15.html)

> `ssh bandit14@bandit.labs.overthewire.org -p 2220` with password `fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq`

**Level Goal:** The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost. ( `ssh, telnet, nc, openssl, s_client, nmap` )

```bash
$ cat /etc/bandit_pass/bandit14 | nc localhost 30000
"Correct!"
"jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt"
```

### [Level 15 → Level 16](https://overthewire.org/wargames/bandit/bandit16.html)

> `ssh bandit15@bandit.labs.overthewire.org -p 2220` with password `jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt`

**Level Goal:** The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption. ( `ssh, telnet, nc, openssl, s_client, nmap` )

```bash
$ man telnet | grep ssl  # Doesn't give matches
$ man ssh | grep ssl  -C 5  # Doesn't give interesting matches
$ man nmap | grep ssl -C 5  # Doesn't give interesting matches
$ man openssl-s_client # That's it
$ openssl s_client -host localhost -port 30001
"
> ---
> read R BLOCK
"
jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
"
> Correct!
> JQttfApK4SeyHwDlI9SXGR50qclOAil1
"
```

### [Level 16 → Level 17](https://overthewire.org/wargames/bandit/bandit17.html)

> `ssh bandit16@bandit.labs.overthewire.org -p 2220` with password `JQttfApK4SeyHwDlI9SXGR50qclOAil1`

**Level Goal:** The credentials for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don’t. There is only 1 server that will give the next credentials, the others will simply send back to you whatever you send to it. ( `ssh, telnet, nc, openssl, s_client, nmap` )

```bash
$ nmap localhost -p 31000-32000
"Starting Nmap 7.80 ( https://nmap.org ) at 2022-11-18 14:54 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00013s latency).
Not shown: 996 closed ports
PORT      STATE SERVICE
31046/tcp open  unknown
31518/tcp open  unknown
31691/tcp open  unknown
31790/tcp open  unknown
31960/tcp open  unknown"

# After trying several ones...
$ openssl s_client -host localhost -port 31790
> ---
> read R BLOCK
JQttfApK4SeyHwDlI9SXGR50qclOAil1
> Correct!
"-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----"
```

### [Level 17 → Level 18](https://overthewire.org/wargames/bandit/bandit18.html)

> `ssh bandit17@bandit.labs.overthewire.org -p 2220 -i lvl18.pem`

**Level Goal:** There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new. ( `cat, grep, ls, diff` )

```bash
$ diff passwords.old passwords.new
"42c42
< 09wUIyMU4YhOzl1Lzxoz0voIBzZ2TUAf
---
> hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg"
```

### [Level 18 → Level 19](https://overthewire.org/wargames/bandit/bandit19.html)

> `ssh bandit18@bandit.labs.overthewire.org -p 2220` with password `hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg`

**Level Goal:** The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH. ( `ssh, ls, cat` )

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 bash
$ ls
$ cat readme
'awhqfNnAbc1naukrpqDYcF95h7HoMTrC'
```

### [Level 19 → Level 20](https://overthewire.org/wargames/bandit/bandit20.html)

> `ssh bandit19@bandit.labs.overthewire.org -p 2220` with password `awhqfNnAbc1naukrpqDYcF95h7HoMTrC`

**Level Goal:** To gain access to the next level, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.

```bash
$ ./bandit20-do
$ ./bandit20-do cat /etc/bandit_pass/bandit20
'VxCazJaVykI6W36BkBU0mJTCM8rR95XT'
```

### [Level 20 → Level 21](https://overthewire.org/wargames/bandit/bandit21.html)

> `ssh bandit20@bandit.labs.overthewire.org -p 2220` with password `VxCazJaVykI6W36BkBU0mJTCM8rR95XT`

**Level Goal:** There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21). ( `ssh, nc, cat, bash, screen, tmux, Unix ‘job control’ (bg, fg, jobs, &, CTRL-Z, …)` )

```bash
$ ./suconnect
"Usage: ./suconnect <portnumber>
This program will connect to the given port on localhost using TCP. If it receives the correct password from the other side, the next password is transmitted back."

$ screen
$ C-a |
$ C-a tab
$ C-a c
$ nc -l 1234
$ C-a tab
$ ./suconnect 1234
(paste password: VxCazJaVykI6W36BkBU0mJTCM8rR95XT)
NvEJF7oVjkddltPSrdKEFOllh9V1IBcq
```

> **Key-Takeaways:**
>
> The `screen` utility is  a full-screen window manager that multiplexes a physical terminal between several processes (typically interactive shells). It is very useful for dealing with multiple windows. Pressing `C-a` (in windows ctrl+A) and later a command, one can:
>
> * `C-a c` : Open and enter a new window.
> * `C-a digit` : Switch to window number 0-9.
> * `C-a C-a` : Get back to previous window.
> * `C-a |` : Split the current region vertically into two new vertical regions.
> * `C-a tab` : Switch the input focus to the next region.
{: .notice--success}

### [Level 21 → Level 22](https://overthewire.org/wargames/bandit/bandit22.html)

> `ssh bandit21@bandit.labs.overthewire.org -p 2220` with password `NvEJF7oVjkddltPSrdKEFOllh9V1IBcq`

**Level Goal:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed. ( `cron, crontab, crontab(5)` )

```bash
$ man cron
$ ls /etc/cron.d/
$ cat cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
* * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
'WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff'
```

> **Key-Takeaways:** In cron `* * * * *` means every minute of every day of every week of every month.
{: .notice--success}

### [Level 22 → Level 23](https://overthewire.org/wargames/bandit/bandit23.html)

> `ssh bandit22@bandit.labs.overthewire.org -p 2220` with password `WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff`

**Level Goal:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

```bash
$ cd /etc/cron.d/
$ cat cronjob_bandit23
'@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null'
$ cat /usr/bin/cronjob_bandit23.sh
'#!/bin/bash
myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
cat /etc/bandit_pass/$myname > /tmp/$mytarget'
$ echo I am user bandit22 | md5sum | cut -d ' ' -f 1
'8169b67bd894ddbb4412f91573b38db3'
$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
'QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G'
```

### [Level 23 → Level 24](https://overthewire.org/wargames/bandit/bandit24.html)

> `ssh bandit23@bandit.labs.overthewire.org -p 2220` with password `QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G`

**Level Goal:** A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed. **NOTE:** This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!

```bash
$ cd /etc/cron.d/
$ cat cronjob_bandit24
'@reboot bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null
* * * * * bandit24 /usr/bin/cronjob_bandit24.sh &> /dev/null'
$ cat /usr/bin/cronjob_bandit24.sh
'#!/bin/bash

myname=$(whoami)
cd /var/spool/$myname/foo
echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
for i in * .*;
do
    if [ "$i" != "." -a "$i" != ".." ];
    then
        echo "Handling $i"
        owner="$(stat --format "%U" ./$i)"
        if [ "${owner}" = "bandit23" ]; then
            timeout -s 9 60 ./$i
        fi
        rm -f ./$i
    fi
done'

$ touch /tmp/my_pass
$ chmod 777 /tmp/my_pass
$ cd /var/spool/bandit24/foo
$ vim my_script.sh
```

Put the folowing content:

```bash
#!/bin/bash
cat /etc/bandit_pass/bandit24 > /tmp/my_pass
```

Make it executable for bandit24 (the user running the script).

```bash
chmod 777 /var/spool/bandit24/foo/my_script.sh
```

After a minute...

```bash
$ cat /tmp/my_pass
'VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar'
```

### [Level 24 → Level 25](https://overthewire.org/wargames/bandit/bandit25.html)

> `ssh bandit24@bandit.labs.overthewire.org -p 2220` with password `VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar`

**Level Goal:** A daemon is listening on port 30002 and will give you the password for bandit25 if given the password for bandit24 and a secret numeric 4-digit pincode. There is no way to retrieve the pincode except by going through all of the 10000 combinations, called brute-forcing.

```bash
$ nc localhost 30002
'I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.'
test test
'Wrong! Please enter the correct current password. Try again.'
test
'Fail! You did not supply enough data. Try again.'
$ echo VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar 0000 | nc localhost 30002
'I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.
Wrong! Please enter the correct pincode. Try again.'
$ cd /tmp
$ vim my_script.sh
$ for i in {0001..9999}; do; echo VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar $i; done | nc localhost 30002 > log.txt
$ uniq log.txt
'I am the pincode checker for user bandit25. Please enter the password for user bandit24 and the secret pincode on a single line, separated by a space.
Wrong! Please enter the correct pincode. Try again.
Correct!
The password of user bandit25 is p7TaowMYrmu23Ol8hiZh9UvD0O9hpx8d'
```

### [Level 25 → Level 26](https://overthewire.org/wargames/bandit/bandit26.html)

> `ssh bandit25@bandit.labs.overthewire.org -p 2220` with password `p7TaowMYrmu23Ol8hiZh9UvD0O9hpx8d`

**Level Goal:** Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it. ( `ssh, cat, more, vi, ls, id, pwd` )

```bash
$ ssh bandit26@bandit.labs.overthewire.org -p 2220 -i bandit26.sshkey
"...
  _                     _ _ _   ___   __
 | |                   | (_) | |__ \ / /
 | |__   __ _ _ __   __| |_| |_   ) / /_
 | '_ \ / _` | '_ \ / _` | | __| / / '_ \
 | |_) | (_| | | | | (_| | | |_ / /| (_) |
 |_.__/ \__,_|_| |_|\__,_|_|\__|____\___/
Connection to bandit.labs.overthewire.org closed."
```

```bash
$ cat /etc/passwd | grep bandit26
bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext
```

This reads as:

* **Username:** `bandit26`.
* **Password:** An `x` character indicates that encrypted password is stored in /etc/shadow file.
* **User ID (UID):** `11026`. UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups.
* **Group ID (GID):** `11026` (The primary group ID stored in /etc/group file).
* **User ID Info (GECOS):** User comment `bandit level 26`.
* **Home directory:** `/home/bandit26`
* **Command/shell:** `/usr/bin/showtext`

```bash
$ cat /usr/bin/showtext
'#!/bin/sh

export TERM=linux

exec more ~/text.txt
exit 0'
```

`#!/bin/sh` means that we are using the **Bourne shell**. The solution consists on getting the terminal window small enough so `more` has to paginate the output of what is inside the text file. Then, press `v` , `:` and put the command `e /etc/bandit_pass/bandit26`

```bash
'c7GvcKlw9mC7aUQaPx7nwFstuAIBw1o1'
```

For getting into the bash.

```bash
:set shell=/bin/bash
:shell
```

> **Key-Takeaway:** The text file `passwd` at `/etc` stores user account information required during login. It contains a list of the system’s accounts, giving for each account some useful information like user ID, group ID, home directory, shell, and more.
{: .notice--success}

### [Level 26 → Level 27](https://overthewire.org/wargames/bandit/bandit27.html)

> `ssh bandit26@bandit.labs.overthewire.org -p 2220` with password `c7GvcKlw9mC7aUQaPx7nwFstuAIBw1o1`

**Level Goal:** Good job getting a shell! Now hurry and grab the password for bandit27!

The solution consists on getting the terminal window small enough so `more` has to paginate the output of what is inside the text file. Then, press `v` and put the following

```bash
:set shell=/bin/bash
:shell
```

```bash
$ ./bandit27-do cat /etc/bandit_pass/bandit27
'YnQpBuifNMas1hcUFk70ZmqkhUU2EuaS'
```

### [Level 27 → Level 28](https://overthewire.org/wargames/bandit/bandit28.html)

> `ssh bandit27@bandit.labs.overthewire.org -p 2220` with password `YnQpBuifNMas1hcUFk70ZmqkhUU2EuaS`

**Level Goal:** There is a git repository at `ssh://bandit27-git@localhost/home/bandit27-git/repo` .  The password for the user bandit27-git is the same as for the user bandit27. Clone the repository and find the password for the next level.

> **Possible commands:** `git`

```bash
$ cd /tmp
$ mktemp -d
'/tmp/tmp.j6pVgG0iEt'
$ cd /tmp/tmp.j6pVgG0iEt
$ git clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo
$ cd repo
$ cat README
'The password to the next level is: AVanL161y9rsbcJIsFHuw35rjaOM19nR'
```

### [Level 28 → Level 29](https://overthewire.org/wargames/bandit/bandit29.html)

> `ssh bandit28@bandit.labs.overthewire.org -p 2220` with password `AVanL161y9rsbcJIsFHuw35rjaOM19nR`

**Level Goal:** There is a git repository at ssh://bandit28-git@localhost/home/bandit28-git/repo. The password for the user bandit28-git is the same as for the user bandit28.

> **Possible commands:** `git`

```bash
$ cd /tmp
$ mktemp -d
/tmp/tmp.j6pVgG0iEt
$ cd /tmp/tmp.j6pVgG0iEt
$ git clone ssh://bandit28-git@localhost:2220/home/bandit28-git/repo
$ cd repo
$ cat README.md
"
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: xxxxxxxxxx
"
$ git log
"
commit 43032edb2fb868dea2ceda9cb3882b2c336c09ec (HEAD -> master, origin/master, origin/HEAD)
Author: Morla Porla <morla@overthewire.org>
Date:   Thu Sep 1 06:30:25 2022 +0000

    fix info leak

commit bdf3099fb1fb05faa29e80ea79d9db1e29d6c9b9
Author: Morla Porla <morla@overthewire.org>
Date:   Thu Sep 1 06:30:25 2022 +0000

    add missing data

commit 43d032b360b700e881e490fbbd2eee9eccd7919e
Author: Ben Dover <noone@overthewire.org>
Date:   Thu Sep 1 06:30:24 2022 +0000

    initial commit of README.md
"
$ git checkout bdf3099fb1fb05faa29e80ea79d9db1e29d6c9b9
$ cat README.md
"
# Bandit Notes
Some notes for level29 of bandit.

## credentials

- username: bandit29
- password: tQKvmcwNYcFS6vmPHIUSI3ShmsrQZK8S
"
```

### [Level 29 → Level 30](https://overthewire.org/wargames/bandit/bandit30.html)

> `ssh bandit29@bandit.labs.overthewire.org -p 2220` with password `tQKvmcwNYcFS6vmPHIUSI3ShmsrQZK8S`

**Level Goal:** There is a git repository at `ssh://bandit29-git@localhost/home/bandit29-git/repo` . The password for the user bandit29-git is the same as for the user bandit29. Clone the repository and find the password for the next level.

> **Possible commands:** `git`

```bash
$ mktemp -d /tmp/
/tmp/tmp.XE5GnF5qS2
$ cd /tmp/tmp.XE5GnF5qS2
$ git clone ssh://bandit29-git@localhost:2220/home/bandit29-git/repo
$ cd repo$
$ cat README.md
"
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: <no passwords in production!>
"
$ git branch --all
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/dev
  remotes/origin/master
  remotes/origin/sploits-dev
$ git switch dev
$ cat README.md
"
# Bandit Notes
Some notes for bandit30 of bandit.

## credentials

- username: bandit30
- password: xbhV3HpNGlTIdnjUrdAlPzc2L6y9EOnS
"
```

### [Level 30 → Level 31](https://overthewire.org/wargames/bandit/bandit31.html)

> `ssh bandit30@bandit.labs.overthewire.org -p 2220` with password `xbhV3HpNGlTIdnjUrdAlPzc2L6y9EOnS`

**Level Goal:** There is a git repository at `ssh://bandit30-git@localhost/home/bandit30-git/repo` . The password for the user bandit30-git is the same as for the user bandit30. Clone the repository and find the password for the next level.

> **Possible commands:** `git`

```bash
$ mktemp -d /tmp/
/tmp/tmp.ULsl4sbSTY
$ cd /tmp/tmp.ULsl4sbSTY
$ git clone ssh://bandit30-git@localhost:2220/home/bandit30-git/repo
$ cd repo$
$ cat README.md
"just an epmty file... muahaha"
$ git show-ref --tags
$ git cat-file -p 831aac2e2341f009e40e46392a4f5dd318483019
"OoffzGDlzhAlerFJ2cAiz1D41JW1Mhmt"
```

> **Key-Takeaway:**
>
> * `git show-ref` : List references in a local repository.
> * `git cat-file` : Provide content or type and size information for repository objects.
{: .notice--success}

### [Level 31 → Level 32](https://overthewire.org/wargames/bandit/bandit32.html)

> `ssh bandit31@bandit.labs.overthewire.org -p 2220` with password `OoffzGDlzhAlerFJ2cAiz1D41JW1Mhmt`

**Level Goal:** There is a git repository at `ssh://bandit31-git@localhost/home/bandit31-git/repo` . The password for the user bandit31-git is the same as for the user bandit31. Clone the repository and find the password for the next level.

> **Possible commands:** `git`

```bash
$ mktemp -d
/tmp/tmp.XwqJevh0V1
$ cd /tmp/tmp.XwqJevh0V1
$ git clone ssh://bandit31-git@localhost:2220/home/bandit31-git/repo
$ cd repo
$ cat README.md
"
This time your task is to push a file to the remote repository.

Details:
    File name: key.txt
    Content: 'May I come in?'
    Branch: master
"
$ echo 'May I come in?' > key.txt
$ git add key.txt
"The following paths are ignored by one of your .gitignore files:
key.txt"
$ cat .gitignore
"*.txt"
$ rm .gitignore
$ git add key.txt
$ commit -m "my commit"
$ git push
"
[...]
remote: ### Attempting to validate files... ####
remote:
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote:
remote: Well done! Here is the password for the next level:
remote: rmCBvG56y58BXzv98yZGdO7ATVL5dW8y
remote:
remote: .oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.oOo.
remote:
[...]
"
```

### [Level 32 → Level 33](https://overthewire.org/wargames/bandit/bandit33.html)

> `ssh bandit32@bandit.labs.overthewire.org -p 2220` with password `rmCBvG56y58BXzv98yZGdO7ATVL5dW8y`

**Level Goal:** After all this git stuff its time for another escape. Good luck! ( `sh, man` )

```bash
$ $0 # Executes bash
$ cd
$ cat /etc/bandit_pass/bandit33
'odHo63fHiFqcWWJG9rLiLDtPm45KzUKy'
```

### [Level 33 → Level 34](https://overthewire.org/wargames/bandit/bandit34.html)

> `ssh bandit33@bandit.labs.overthewire.org -p 2220` with password `odHo63fHiFqcWWJG9rLiLDtPm45KzUKy`

```bash
$ ls
README.txt
$ cat README.txt
"Congratulations on solving the last level of this game!

At this moment, there are no more levels to play in this game. However, we are constantly working
on new levels and will most likely expand this game with more levels soon.
Keep an eye out for an announcement on our usual communication channels!
In the meantime, you could play some of our other wargames.

If you have an idea for an awesome new level, please let us know!"
```

## Conclusion

In conclusion, `Bandit@overthewire.org` is a valuable resource for anyone looking to enhance their cybersecurity skills. By working through each level, you will not only learn about various security techniques and Linux commands, but also get hands-on experience putting those skills into practice.

I hope that this guide will be a helpful resource for anyone looking to improve their cybersecurity skills and make the most of their experience with `Bandit@overthewire.org` . 

Good luck and happy learning!
