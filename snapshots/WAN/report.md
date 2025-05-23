# WAN Commands Output

## Table of Contents

- [show lldp neighbors](#show-lldp-neighbors)
- [show ip interface brief](#show-ip-interface-brief)
- [show interfaces description](#show-interfaces-description)
- [show version](#show-version)
- [show running-config](#show-running-config)
## show interfaces description

```
Interface                      Status         Protocol           Description
Et1                            up             up                 P2P_LINK_TO_DC1_BORDER_LEAF1_Ethernet5
Et2                            up             up                 P2P_LINK_TO_DC1_BORDER_LEAF2_Ethernet5
Et3                            up             up                 P2P_LINK_TO_DC2_BORDER_LEAF1_Ethernet5
Et4                            up             up                 P2P_LINK_TO_DC2_BORDER_LEAF2_Ethernet5
Lo0                            up             up                 EVPN_Overlay_Peering
Ma0                            up             up                 oob_management
```
## show ip interface brief

```
Address
Interface       IP Address          Status     Protocol          MTU    Owner  
--------------- ------------------- ---------- ------------- ---------- -------
Ethernet1       172.16.30.1/31      up         up               9214           
Ethernet2       172.16.30.3/31      up         up               9214           
Ethernet3       172.16.30.5/31      up         up               9214           
Ethernet4       172.16.30.7/31      up         up               9214           
Loopback0       10.255.30.31/32     up         up              65535           
Management0     192.168.4.30/24     up         up               1500
```
## show lldp neighbors

```
Last table change time   : 1:46:33 ago
Number of table inserts  : 20
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC1_BORDER_LEAF1         Ethernet5           120
Et2           DC1_BORDER_LEAF2         Ethernet5           120
Et3           DC2_BORDER_LEAF1         Ethernet5           120
Et4           DC2_BORDER_LEAF2         Ethernet5           120
Ma0           DC1_LEAF2B               Management0         120
Ma0           DC1_LEAF1B               Management0         120
Ma0           DC2_BORDER_LEAF1         Management0         120
Ma0           DC2_LEAF1B               Management0         120
Ma0           DC2_LEAF2A               Management0         120
Ma0           DC2_SPINE1               Management0         120
Ma0           dc2-client4              Management0         120
Ma0           DC1_LEAF2A               Management0         120
Ma0           DC1_SPINE2               Management0         120
Ma0           DC1_LEAF1A               Management0         120
Ma0           DC2_LEAF1A               Management0         120
Ma0           dc1-client2              Management0         120
Ma0           DC1_SPINE1               Management0         120
Ma0           dc1-client4              Management0         120
Ma0           dc1-client1              Management0         120
Ma0           dc1-client3              Management0         120
```
## show running-config

```
! Command: show running-config
! device: WAN (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
!
no aaa root
aaa authentication policy local allow-nopassword-remote-login
!
username admin privilege 15 role network-admin secret sha512 $6$7GTxsrRjnwheeKfR$zhJ8qycVjAJz41rf5JRSfWIzp93IL5WL7sMS/Taz1yfShz.MAnoajCf7R2n1/EZW7PN5QA3Huayl0lVQesBYN1
username coder privilege 15 role network-admin nopassword
!
management api http-commands
   no shutdown
   !
   vrf MGMT
      no shutdown
!
vlan internal order ascending range 1006 1199
!
no service interface inactive port-id allocation disabled
!
transceiver qsfp default-mode 4x10G
!
service routing protocols model multi-agent
!
hostname WAN
ip name-server vrf MGMT 1.1.1.1
ip name-server vrf MGMT 8.8.8.8
!
spanning-tree mode mstp
!
system l1
   unsupported speed action error
   unsupported error-correction action error
!
vrf instance MGMT
!
aaa authorization exec default local
!
interface Ethernet1
   description P2P_LINK_TO_DC1_BORDER_LEAF1_Ethernet5
   mtu 9214
   no switchport
   ip address 172.16.30.1/31
!
interface Ethernet2
   description P2P_LINK_TO_DC1_BORDER_LEAF2_Ethernet5
   mtu 9214
   no switchport
   ip address 172.16.30.3/31
!
interface Ethernet3
   description P2P_LINK_TO_DC2_BORDER_LEAF1_Ethernet5
   mtu 9214
   no switchport
   ip address 172.16.30.5/31
!
interface Ethernet4
   description P2P_LINK_TO_DC2_BORDER_LEAF2_Ethernet5
   mtu 9214
   no switchport
   ip address 172.16.30.7/31
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.30.31/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.30/24
!
ip routing
no ip routing vrf MGMT
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.30.0/24 eq 32
!
ip route vrf MGMT 0.0.0.0/0 192.168.4.1
!
ntp server vrf MGMT time.google.com prefer iburst
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
router bgp 65300
   router-id 10.255.30.31
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   maximum-paths 4 ecmp 4
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor 172.16.30.0 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.16.30.0 remote-as 65103
   neighbor 172.16.30.0 description DC1_BORDER_LEAF1
   neighbor 172.16.30.2 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.16.30.2 remote-as 65103
   neighbor 172.16.30.2 description DC1_BORDER_LEAF2
   neighbor 172.16.30.4 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.16.30.4 remote-as 65203
   neighbor 172.16.30.4 description DC2_BORDER_LEAF1
   neighbor 172.16.30.6 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.16.30.6 remote-as 65203
   neighbor 172.16.30.6 description DC2_BORDER_LEAF2
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family ipv4
      neighbor IPv4-UNDERLAY-PEERS activate
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
Serial number: 9F879A4DE377884CDEB46C06C4811B7E
Hardware MAC address: 001c.7340.5842
System MAC address: 001c.7340.5842

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 2 hours and 4 minutes
Total memory: 65343820 kB
Free memory: 36299720 kB
```
