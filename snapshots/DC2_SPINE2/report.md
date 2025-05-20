# DC2_SPINE2 Commands Output

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
Et6                            up             up                 
Ma0                            up             up
```
## show ip interface brief

```
Address
Interface       IP Address            Status     Protocol        MTU    Owner  
--------------- --------------------- ---------- ------------ --------- -------
Management0     172.100.100.22/24     up         up             1500
```
## show lldp neighbors

```
Last table change time   : 0:00:13 ago
Number of table inserts  : 22
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           dc2-leaf1a               Ethernet2           120
Et2           dc2-leaf1b               Ethernet2           120
Et3           dc2-leaf2a               Ethernet2           120
Et4           dc2-leaf2b               Ethernet2           120
Et5           dc2-border-leaf1         Ethernet2           120
Et6           dc2-border-leaf2         Ethernet2           120
Ma0           dc1-spine1               Management0         120
Ma0           dc2-spine1               Management0         120
Ma0           dc1-client2              36f4.f811.95c5      120
Ma0           dc2-client3              6608.b9b1.0b5c      120
Ma0           dc1-client4              72ac.cc71.d8c6      120
Ma0           dc2-client1              feda.1645.4ab9      120
Ma0           dc2-client2              622c.9e02.895a      120
Ma0           dc2-client4              127e.6873.6ae5      120
Ma0           dc2-leaf1b               Management0         120
Ma0           dc1-client3              1698.659a.9a05      120
Ma0           dc2-leaf1a               Management0         120
Ma0           dc1-client1              0eb0.0f00.c349      120
Ma0           dc2-leaf2b               Management0         120
Ma0           dc1-leaf1b               Management0         120
Ma0           001c.73b6.e01e           Management0         120
Ma0           dc1-border-leaf1         Management0         120
```
## show running-config

```
! Command: show running-config
! device: dc2-spine2 (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
!
no aaa root
!
username admin privilege 15 role network-admin secret sha512 $6$FXiiPZ3MJG0yMN/1$A0Wvfehu0aUnmZi5dPaJVOTAtzppBJs6Xu7Kro3t64aZPKaAGcVOLSsc84OjZgcrZtjfFXTV8zU3EojI4YUJc0
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
hostname dc2-spine2
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
interface Ethernet6
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 172.100.100.22/24
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
Serial number: 5B7D66A2E89FA65C2D920178CF2DB763
Hardware MAC address: 001c.7303.6915
System MAC address: 001c.7303.6915

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 1 minute
Total memory: 65343820 kB
Free memory: 44315472 kB
```
