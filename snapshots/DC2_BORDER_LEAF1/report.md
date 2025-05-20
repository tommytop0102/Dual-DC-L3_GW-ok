# DC2_BORDER_LEAF1 Commands Output

## Table of Contents

- [show lldp neighbors](#show-lldp-neighbors)
- [show ip interface brief](#show-ip-interface-brief)
- [show interfaces description](#show-interfaces-description)
- [show version](#show-version)
- [show running-config](#show-running-config)
## show interfaces description

```
Interface                      Status         Protocol           Description
Et1                            up             up                 
Et2                            up             up                 
Et3                            up             up                 
Et4                            up             up                 
Et5                            up             up                 
Ma0                            up             up
```
## show ip interface brief

```
Address
Interface       IP Address            Status     Protocol        MTU    Owner  
--------------- --------------------- ---------- ------------ --------- -------
Management0     172.100.100.23/24     up         up             1500
```
## show lldp neighbors

```
Last table change time   : 0:00:13 ago
Number of table inserts  : 21
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           dc2-spine1               Ethernet5           120
Et2           dc2-spine2               Ethernet5           120
Et3           dc2-border-leaf2         Ethernet3           120
Et4           dc2-border-leaf2         Ethernet4           120
Et5           wan                      Ethernet3           120
Ma0           dc1-client4              72ac.cc71.d8c6      120
Ma0           dc1-client2              36f4.f811.95c5      120
Ma0           dc2-client3              6608.b9b1.0b5c      120
Ma0           dc2-client1              feda.1645.4ab9      120
Ma0           dc2-client2              622c.9e02.895a      120
Ma0           dc2-client4              127e.6873.6ae5      120
Ma0           dc1-client3              1698.659a.9a05      120
Ma0           dc1-client1              0eb0.0f00.c349      120
Ma0           dc1-spine2               Management0         120
Ma0           001c.736f.0b0a           Management0         120
Ma0           dc1-spine1               Management0         120
Ma0           001c.73fd.3539           Management0         120
Ma0           dc1-border-leaf2         Management0         120
Ma0           dc1-leaf2b               Management0         120
Ma0           001c.735d.c69d           Management0         120
Ma0           wan                      Management0         120
```
## show running-config

```
! Command: show running-config
! device: dc2-border-leaf1 (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
!
no aaa root
!
username admin privilege 15 role network-admin secret sha512 $6$V13qY0T8Cn18ta.l$PDbkQmWBYg/b8JX3t9XPxEY2hdquN21pcyuR5OOjo4k.x/Jfqrp0Ed2Cpmbzz2PjXtncDZwvvdIvUwRbSHVUN0
!
management api http-commands
   protocol https ssl profile eAPI
   no shutdown
   !
   vrf MGMT
      no shutdown
!
no service interface inactive port-id allocation disabled
!
transceiver qsfp default-mode 4x10G
!
service routing protocols model multi-agent
!
hostname dc2-border-leaf1
!
spanning-tree mode mstp
!
system l1
   unsupported speed action error
   unsupported error-correction action error
!
vrf instance MGMT
!
management security
   ssl profile eAPI
      cipher-list HIGH:!eNULL:!aNULL:!MD5:!ADH:!ANULL
      certificate eAPI.crt key eAPI.key
!
interface Ethernet1
!
interface Ethernet2
!
interface Ethernet3
!
interface Ethernet4
!
interface Ethernet5
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 172.100.100.23/24
!
no ip routing
no ip routing vrf MGMT
!
ip route vrf MGMT 0.0.0.0/0 172.100.100.1
!
router multicast
   ipv4
      software-forwarding kernel
   !
   ipv6
      software-forwarding kernel
!
end
```
## show version

```
Arista cEOSLab
Hardware version: 
Serial number: E76370CF179814A7D132A374957D9811
Hardware MAC address: 001c.7397.bdb4
System MAC address: 001c.7397.bdb4

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 1 minute
Total memory: 65343820 kB
Free memory: 44319756 kB
```
