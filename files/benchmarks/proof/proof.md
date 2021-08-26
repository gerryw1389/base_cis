
# Level 1 Server CIS Benchmarks:

| OS Version | Percent Passed |
| --- | --- |  
| 2012 Member Server | 97.43 |
| 2012 Domain Controller | 97.34 |
| 2016 Member Server | 98.27 |
| 2016 Domain Controller | 97.49 |
| Centos 7.6.1810 | 95.57 |
| RHEL 7.6 Maipo| 96.84|

#### Pics:

2012 Member Server:  
[![2012 Member Server](./2012client.jpg)](./2012client.jpg)

2012 Domain Controller:  
[![2012 Domain Controller](./2012dc.jpg)](./2012dc.jpg)

2016 Member Server:  
[![2016 Member Server](./2016client.jpg)](./2016client.jpg)

2016 Domain Controller:  
[![2016 Domain Controller](./2016dc.jpg)](./2016dc.jpg)

#### Group Policy on the primary Domain Controller (2016dc):

2016 Domain Controller:  
[![2016 GPO](./no-gpos-applied.jpg)](./no-gpos-applied.jpg)

#### Results from `gpresult /scope computer /h c:\scripts\computer.html`:  
[![2016 Computer Policy](./gpo-computer.jpg)](./gpo-computer.jpg)


#### Results from `gpresult /scope user /h c:\scripts\user.html`:  
[![2016 User Policy](./gpo-user.jpg)](./gpo-user.jpg)

Centos 7:  
[![Centos 7](./centos.jpg)](./centos.jpg)

RHEL 7:  
[![Redhat 7](./redhat.jpg)](./redhat.jpg)

