# systemd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with systemd](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Puppet interface to systemctl.

This module was creatd to manage systemd services under RHEL/CentOS 7+. In this
version you can do simple things like enable, disable and status services. The
plan is to extend this module to include most of the commonly used options and
capabilities of SystemD. 

## Module Description

"The systemd system and service manager is responsible for controlling how services are started, stopped and otherwise managed on Red Hat Enterprise Linux 7 systems. By offering on-demand service start-up and better transactional dependency controls, systemd dramatically reduces start up times. As a systemd user, you can prioritize critical services over less important services.

Although the systemd process replaces the init process (quite literally, /sbin/init is now a symbolic link to /usr/lib/systemd/systemd) for starting services at boot time and changing runlevels, systemd provides much more control than the init process does while still supporting existing init scripts. Here are some examples of the features of systemd:

* **Logging:** From the moment that the initial RAM disk is mounted to start the Linux kernel to final shutdown of the system, all log messages are stored by the new systemd journal. Before the systemd journal existed, initial boot messages were lost, requiring that you try to watch the screen as messages scrolled by to debug boot problems.
Now, all system messages come in on a single stream and are stored in the /run directory. Messages can then be consumed by the rsyslog facility (and redirected to traditional log files in the /var/log directory or to remote log servers) or displayed using the journalctl command across a variety of attributes.

* **Dependencies:** With systemd, an explicit set of dependencies can be defined for each service, instead of being implied by boot order. This allows a service to start at any point that its dependencies are met. In this way, many services can start at the same time, making the boot process faster. Likewise, complex sets of dependencies can be set up, so the exact requirements of a service (such as storage availability or file system checking) can be met before a service starts.

* **Cgroups:** Services are identified by Cgroups, which allow every component of a service to be managed. For example, the older System V init scripts would start a service by launching a process which itself might start other child processes. When the service was killed, it was hoped that the parent process would do the right thing and kill its children. By using Cgroups, all components of a service have a tag that can be used to make sure that all of those components are properly started or stopped.

* **Activating services:** Services don't just have to be always running or not running based on runlevel, as they were previous to systemd. Services can now be activated based on path, socket, bus, timer, or hardware activation. Likewise, because systemd can set up sockets, if a process handling communications goes away, the process that starts up in its place can pick up the next message from the socket. To the clients using the service, it can look as though the service continued without interruption.

* **More than services:** Instead of just managing services, systemd can manage several different unit types. These unit types include:

 * **Devices:** Create and use devices.
 * **Mounts and automounts:** Mount file systems upon request or automount a file system based on a request for a file or directory within that file system.
 * **Paths:** Check the existence of files or directories or create them as needed.
 * **Services:** Start a service, which often means launching a service daemon and related components.
 * **Slices:** Divide up computer resources (such as CPU and memory) and apply them to selected units.
 * **Snapshots:** Take snapshots of the current state of the system.
 * **Sockets:** Set up sockets to allow communication paths to processes that can remain in place, even if the underlying process needs to restart.
 * **Swaps:** Create and use swap files or swap partitions.
 * **Targets:** Manage a set of services under a single unit, represented by a target name rather than a runlevel number.
 * **Timers:** Trigger actions based on a timer.

* **Resource management**

 * The fact that each systemd unit is always associated with its own cgroup lets you control the amount of resources each service can use. For example, you can set a percent of CPU usage by service which can put a cap on the total amount of CPU that service can use -- in other words, spinning off more processes won't allow more resources to be consumed by the service. Prior to systemd, nice levels were often used to prevent processes from hogging precious CPU time. With systemd's use of cgroups, precise limits can be set on CPU and memory usage, as well as other resources.
 * A feature called slices lets you slice up many different types of system resources and assign them to users, services, virtual machines, and other units. Accounting is also done on these resources, which can allow you to charge customers for their resource usage."

**(https://access.redhat.com/articles/754933)**

## Setup

## Usage

Simple exampole to disable mysqld from starting at boot:

    systemctl{'mysql':
      command =>  'disable',
    }
  

## Reference


## Limitations

Only tested with RedHat/CentOS 7.

## Contributing

You are most welcome to extend this module. Please do submit your chaqnges so
everyone can benefit. Be sure to write tests! :) 
