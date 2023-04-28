# Commands for process management

## What is a process? And a job?

In Linux, a process is an active instance of a program. A program is an executable file held in storage on your machine.

A job is a process that the shell is managing and hasn’t finished running.

## Interactive vs. Non-interactive processes

Interactive processes (or user processes) are initialized and controlled through a terminal session. Non-interactivem processes (also called automatic or batch processes) are started by the system and are not connected to the terminal.

## How are processes identified?

Since Linux is a multi-process and multi-users OS, each process must be uniquely identifed by the kernel.

Processes are identified by their process ID (PID) and their parent process id (PPID). This way, processes  can be classified into:

* Parent processes - a process that creates one or more (child) processes.
* Child process - they are created by another (parent) process during its execution.

## Find a processes and its PID

`ps` displays information about a selection of the active processes. If you want a repetitive update of the selection and the displayed information, use `top` (or `htop`) instead. `ps -A` or `ps -e` will output all processes:

```bash
$ ps -A
  PID TTY          TIME CMD
    1 ?        00:00:00 docker-init
    7 ?        00:00:00 sleep
   17 ?        00:00:00 dockerd
   45 ?        00:00:00 sshd
   51 ?        00:00:01 containerd
 1422 ?        00:00:00 sh
 1483 ?        00:00:00 sh
 2117 ?        00:00:00 sh
 2124 ?        00:00:10 node
 2152 ?        00:00:14 node
 ```

If we know the name of the process, then we can use `pidof` to get PID:

```bash
$ pidof node
2152 2124
```

The output of `ps` can be formatted:

```bash
$ ps -Ao pid,ppid,comm
    1     0 docker-init
    7     1 sleep
   17     7 dockerd
   45     1 sshd
   51    17 containerd
 1422     0 sh
 1483     0 sh
 2117     0 sh
 2124  2117 node
 2152  2124 node
```

Format options include: `pid`, `ppid`, `comm`

> **Note**
>     
> `ps` accepts several kinds of options:
> 
> * UNIX options - which may be grouped and must be preceded by a dash
> * BSD options - which may be grouped and must not be used with a dash
> * GNU long options - which are preceded by two dashes
>
> Options of different types may be freely mixed, but conflicts can appear.
> 
> Some options are equivalent, but not all. For example, `ps -Ao` and `ps axo` produce the same result, but `ps -aux` is distinct from `ps aux`.

# TODO

- [x] what is a process
- [x] what is a jobs
- [x] get PID: ps
- [x] get PID: pidof
- [x] get PID: jobs
- [ ] more baout ps
- [ ] foreground
- [ ] background 
- [ ] staus of processes
- [ ] kill a process
- [ ] send a signal
- [ ] priority
- [ ] renice