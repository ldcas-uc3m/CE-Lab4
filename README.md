# Lab 4: Port Scanning
By Luis Daniel Casais Mezquida  
Cybersecurity Engineering 22/23  
Bachelor's Degree in Computer Science and Engineering, grp. 89  
Universidad Carlos III de Madrid

## Project statement
The goal of this lab is to learn how to use a popular port scanning tool to scan a host and analyze the output.  

### Activities
1. Run a ping scan in the `192.168.56.1/24` subnetwork. List all hosts that are reported as up.
2. Scan all ports of the target host (the Metaesploitable2 machine) using two different methods.
3. Find the device type, OS and version of the target host.
4. Run a service detection only for those ports determined as open in step (2). Run it again using all service probes and compare the result with the default service detection.
5. Notice that the target machine is running a bindshell over some TCP port. Connect to it and check that this is a backdoor that gives you root access. Use the privileges to steal the password files from the target machine. Crack it and report as many passwords as you can.


## Installation and execution

First configure the VMs.

1. Get a [kali VM image](https://www.kali.org/get-kali/#kali-virtual-machines) and install the VM in [Virtual Box](https://www.virtualbox.org/). Just use `Machine` > `Add` and select the `.vbox` file.  
The credentials for this machine are `kali:kali`.  
Note that you can use any other Linux distro, just make sure you install [`nmap`](https://nmap.org/) and [`netcat`/`nc`](https://netcat.sourceforge.net/).
2. Download the [Metaesploitable2](https://sourceforge.net/projects/metasploitable/) distribution and create a VM with it in Virtual Box.
    1. Create a new VM with `Machine` > `New`. Use `Type`: `Linux` and `Version`: `Other Linux (64-bit)`.
    2. Default hardware config (512MB RAM and 1 CPU) should do.
    3. On `Virtual Hard Disk` select `Use an Existing Virtual Hard Disk File` and add and choose the `Metaexploitable.vmdk` file.

    The credentials for this machine are `msfadmin:msfadmin`.
3. Create a virtual network (`Tools` > `Network` > `Create`) on the `192.168.56.1/24` IP address range, and enable the DHCP Server.  
    1. Configure the adapter manually as such:
        - `IPv4 Adress`: `192.168.56.1`
        - `IPv4 Network Mask`: `255.255.255.0`
    2. Configure the DHCP server as such:
        - `Server Adress`: `192.168.56.2`
        - `Server Mask`: `255.255.255.0`
        - `Lower Address Bound`: `192.168.56.3`
        - `Upper Address Bound`: `192.168.56.254`

4. Attach both machines to this network (`Machine` > `Settings` > `Network` → `Attached-to`: `Host-only Adapter`, and select the virtual network name from the drop down menu).
5. Run both machines and check their IPs with `ifconfig`. Remember you can change the keyboard layout in `Settings` > `Keyboard` > `Layout`.
6. Check the machines reach each other by performing a `ping` from one machine to the other.

In order to perform all the steps, run the [`src/script.sh`](src/script.sh) script in the kali machine.


## More information
- Get familiar with the free [nmap book](https://nmap.org/book/toc.html).