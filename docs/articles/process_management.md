# Linux commands for process management

This post covers the fundamentals of Linux process management, which includes monitoring and controlling the processes running on a Linux system. We will discuss how to list processes and jobs, terminate them, and manage the resources they consume.

## What is a process? And a job?

In Linux, a **process** refers to an active instance of a program, which is an executable file stored on your machine. Meanwhile, a **job** is a process that is being managed by the shell and has not yet completed its execution.

## Interactive vs. Non-interactive processes

**Interactive processes** (or user processes) are launched and managed through a terminal session. On the other hand, **non-interactive processes** (also called automatic or batch processes) are started by the system and are not connected to the terminal.

## How are processes identified?

Since Linux is a multi-process and multi-users OS, each process must be uniquely identifed by the kernel.

Processes are identified by their **Process ID** (PID) and their **Parent Process ID** (PPID). Consequently, processes can be categorized into two types:

* **Parent processes** - They instantiate one or more child processes.
* **Child process** - Created by another a parent process during its execution.

## Find a processes and its PID

`ps` displays information about a specific set of active processes. To continuously update the displayed information and the selected processes, you can use `top` or `htop` instead. If you wish to output information about all processes, you can use the `ps -A` or `ps -e`:

```
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

```
$ pidof node
2152 2124
```

The output of `ps` can be formatted:

```
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

## Run a proces in background

You can run a process in background by appending the & symbol to the command. This will start the process and return control to the terminal immediately.

```
$ command &
```

If the command produces any output, it will continue to write to the terminal even while running in the background. To provent this, the output can be
redirected to a file or to `/dev/null`:

```
$ pip install pandas > /dev/null &
```

Pressing `Ctrl+z` can move any process to the background, but be cautious as this action sends the `SIGSTOP` signal to the process, causing it to pause and the terminal prompt will be returned. 

```
$ pip install pandas
Collecting pandas
^Z
[1]+  Stopped                 pip install pandas
$ jobs
[1]+  Stopped                 pip install pandas
```

At this stage, you have the option to use the `bg` command to move the paused process to the background, where it will continue running.

```
$ bg
```

Alternatively, you can utilize the `fg` command to bring the paused process to the foreground, allowing it to resume running.

## States of a process in Linux

The state of a process signifies its present condition or activity within the operating system. Throughout its execution, a process undergoes transitions between different states depending on its environment and circumstances. Below are the typical states observed in a Linux process:

* **Running** - The process is actively executing and utilizing the CPU.
* **Sleeping (interruptible)** - The process is waiting for an event to occur, such as input or a signal. It can be interrupted and resume execution.
* **Sleeping (uninterruptible)** - The process is waiting for an event, but it cannot be interrupted. This state is typically associated with critical system operations and device drivers.
* **Stopped** - The process has been stopped, usually by receiving a `SIGSTOP` signal.
* **Zombie** - The process has completed its execution but still has an entry in the process table. It exists until its parent process retrieves its exit status.
* **Orphan** - The process has been abandoned by its parent process. It will be re-parented to the proces with PID 1.
* **Dead** - The process has finished its execution and has been removed from the process table.

# TODO

- [ ] kill a process
- [ ] send a signal
- [ ] priority
- [ ] renice