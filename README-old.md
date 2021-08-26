# base_cis
<<<<<<< HEAD
<<<<<<< HEAD
CIS Level 1 Benchmarks for WS2012r2, 2016, Centos7, RHEL7
=======
=======
>>>>>>> 6b79b61... initial push

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with base_cis](#setup)
    * [What base_cis affects](#what-base_cis-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with base_cis](#beginning-with-base_cis)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This puppet module will get you the following CIS Level `one` benchmarks:  

| OS Version | Percent Passed |
| --- | --- |  
| 2012 Member Server | 97.43 |
| 2012 Domain Controller | 97.34 |
| 2016 Member Server | 98.27 |
| 2016 Domain Controller | 97.49 |
| Centos 7.6.1810 | 95.57 |
| RHEL 7.6 Maipo| 96.84|

As seen from above, this module will not get an environment 100% passing checks, but it is a good start! I will try to continue working on this in my free time!

Screenshots can be found under files/benchmarks/proof/proof.pdf


## Setup

`NOTE: This was tested in a testlab with Puppet Enterprise 2019 free edition (10 nodes)`

1. On the puppet master in your environment, run the following:  

```puppet
puppet module install puppetlabs-registry --version 2.1.0
puppet module install puppetlabs-powershell --version 2.3.0
puppet module install fervid-secure_linux_cis --version 1.0.0
```

2. Follow these steps to push this module to your puppet master  

```
# Assuming your testlab puppet master is 10.12.12.200 and you have a local user named 'gerry' with sudo rights.
# Assuming you took the folder 'base_cis' and created a zip file of it and drag-n-drop it to your Windows VM with WSL installed.
####################
# Send the zip file to your puppet master
scp base_cis.zip gerry@10.12.12.200:/home/gerry/base_cis.zip

# now ssh to your host
ssh gerry@10.12.12.200

# once in...
sudo su
cd /etc/puppetlabs/code/environments/production/modules/

# delete older versions of this module if they exist.
rm -rf ./base_cis/

# unzip your transferred file
unzip /home/gerry/base_cis.zip

# change its owner
chown pe-puppet:pe-puppet ./base_cis/
```

3. In the Puppet Website of your server, create a classification under production and add this class to your group.

4. Pin the nodes in your test lab to that classification group for this to take effect!


#### For Windows Hosts:

Simply run `puppet agent -t` and reboot. Then run the CIS Benchmark Assessor program to view your results. Logs can be found under `C:\ProgramData\PuppetLabs\scripts\puppet\logs`.


#### For Linux Hosts:

Run the following on the servers you deploy:

```
sudo su
puppet agent -t
chmod +x /tmp/base_cis_scripts/fix_setup.sh
/tmp/base_cis_scripts/fix_setup.sh
# Set bootloader password to current organization password (different for each server, stored in Password Management Application)
reboot
```

Logs for the checks can be found at `/var/log/cis_logs.log` while the log for the file you manually ran can be found at `/var/log/cis_logs_initialscript.log`. After the reboot, run `puppet agent -t` one more time and then run the CIS Benchmark Assessor program to view your results.

### What base_cis affects

See various benchmarks under `files/benchmarks/` to see setting affected.

**Please use this module in a test lab to view various settings**

### Setup Requirements

Add the following to your puppet file or install manually as seen above:  

```
mod 'puppetlabs-registry', '2.1.0'
mod 'puppetlabs-powershell', '2.3.0'
mod 'fervid-secure_linux_cis', '1.0.0'
```

### Beginning with base_cis

To apply default settings, place the following in `init.pp`:

```
class {'::base_cis':}
```

Structure:
- base_cis::base_centos  
  - ::base_cis::base_centos::centos_template - Pushes over files  
    - ::base_cis::base_centos::centos_cis - Shell scripts that run if out of compliance  
- base_cis::base_rhel  
  - base_cis::base_rhel::rhel_template - Pushes over files  
    - ::base_cis::base_rhel::rhel_cis - Shell scripts that run if out of compliance  
- base_cis::base_windows  
  - base_cis::base_windows::twentysixteen_template - Pushes over files / Powershell scripts that run if out of compliance  
    - ::base_cis::base_windows::twentysixteen_client_registry - Registry settings and most of the local policies  
    - ::base_cis::base_windows::twentysixteen_dc_registry - Registry settings and most of the local policies  
  - base_cis::base_windows::twentytwelve_template - Pushes over files / Powershell scripts that run if out of compliance  
    - ::base_cis::base_windows::twentytwelve_client_registry - Registry settings and most of the local policies   
    - ::base_cis::base_windows::twentytwelve_dc_registry - Registry settings and most of the local policies  


## Usage

First thing to modify would be the regex used to determine if a server is a domain controller or not. This can be found at `base_cis::base_windows::twentysixteen_template ` or `base_cis::base_windows::twentytwelve_template`

The module is designed to run scripts `only` if the test script fails with exit code of `1` using the Puppet [unless](https://puppet.com/docs/puppet/5.3/types/exec.html#exec-attribute-unless) attribute on the Exec resource. It also makes extensive use of the registry resource and the file resource.

## Limitations

Warning - this module is a work in progress! This was tested on:  

Windows Server 2012r2 Domain Controller and member server  
Windows Server 2016v1604 Domain Controller and member server  
Centos 7.6.1810  
RHEL 7.6 Maipo  

## Development

Send a pull request.

## License

MIT License

```
Copyright (c) 2019 Gerry Williams

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
<<<<<<< HEAD
```
>>>>>>> 09f1e52... initial push
=======
```
>>>>>>> 6b79b61... initial push
