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
Et1                            up             up                 P2P_LINK_TO_DC2_LEAF1A_Ethernet2
Et2                            up             up                 P2P_LINK_TO_DC2_LEAF1B_Ethernet2
Et3                            up             up                 P2P_LINK_TO_DC2_LEAF2A_Ethernet2
Et4                            up             up                 P2P_LINK_TO_DC2_LEAF2B_Ethernet2
Et5                            up             up                 P2P_LINK_TO_DC2_BORDER_LEAF1_Ethernet2
Et6                            up             up                 P2P_LINK_TO_DC2_BORDER_LEAF2_Ethernet2
Lo0                            up             up                 EVPN_Overlay_Peering
Ma0                            up             up                 oob_management
```
## show ip interface brief

```
Address
Interface       IP Address           Status     Protocol         MTU    Owner  
--------------- -------------------- ---------- ------------ ---------- -------
Ethernet1       172.31.20.82/31      up         up              9214           
Ethernet2       172.31.20.86/31      up         up              9214           
Ethernet3       172.31.20.90/31      up         up              9214           
Ethernet4       172.31.20.94/31      up         up              9214           
Ethernet5       172.31.20.98/31      up         up              9214           
Ethernet6       172.31.20.102/31     up         up              9214           
Loopback0       10.255.20.4/32       up         up             65535           
Management0     192.168.4.22/24      up         up              1500
```
## show lldp neighbors

```
Last table change time   : 0:00:12 ago
Number of table inserts  : 22
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC2_LEAF1A               Ethernet2           120
Et2           DC2_LEAF1B               Ethernet2           120
Et3           DC2_LEAF2A               Ethernet2           120
Et4           DC2_LEAF2B               Ethernet2           120
Et5           DC2_BORDER_LEAF1         Ethernet2           120
Et6           DC2_BORDER_LEAF2         Ethernet2           120
Ma0           DC1_SPINE1               Management0         120
Ma0           DC1_BORDER_LEAF2         Management0         120
Ma0           DC2_LEAF2A               Management0         120
Ma0           DC1_LEAF1B               Management0         120
Ma0           DC2_BORDER_LEAF2         Management0         120
Ma0           DC2_LEAF1B               Management0         120
Ma0           dc2-client2              Management0         120
Ma0           dc1-client2              Management0         120
Ma0           dc2-client1              Management0         120
Ma0           DC1_BORDER_LEAF1         Management0         120
Ma0           dc2-client4              Management0         120
Ma0           WAN                      Management0         120
Ma0           dc1-client4              Management0         120
Ma0           dc1-client3              Management0         120
Ma0           DC1_LEAF2B               Management0         120
Ma0           DC1_LEAF2A               Management0         120
```
## show running-config

```
! Command: show running-config
! device: DC2-SPINE2 (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
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
hostname DC2_SPINE2
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
   description P2P_LINK_TO_DC2_LEAF1A_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.82/31
!
interface Ethernet2
   description P2P_LINK_TO_DC2_LEAF1B_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.86/31
!
interface Ethernet3
   description P2P_LINK_TO_DC2_LEAF2A_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.90/31
!
interface Ethernet4
   description P2P_LINK_TO_DC2_LEAF2B_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.94/31
!
interface Ethernet5
   description P2P_LINK_TO_DC2_BORDER_LEAF1_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.98/31
!
interface Ethernet6
   description P2P_LINK_TO_DC2_BORDER_LEAF2_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.20.102/31
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.20.4/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.22/24
!
ip routing
no ip routing vrf MGMT
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.20.0/24 eq 32
!
ip route vrf MGMT 0.0.0.0/0 192.168.4.1
!
ntp server vrf MGMT time.google.com prefer iburst
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
!
router bgp 65200
   router-id 10.255.20.4
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   maximum-paths 4 ecmp 4
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor 10.255.20.23 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.23 remote-as 65201
   neighbor 10.255.20.23 description DC2_LEAF1A
   neighbor 10.255.20.24 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.24 remote-as 65201
   neighbor 10.255.20.24 description DC2_LEAF1B
   neighbor 10.255.20.25 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.25 remote-as 65202
   neighbor 10.255.20.25 description DC2_LEAF2A
   neighbor 10.255.20.26 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.26 remote-as 65202
   neighbor 10.255.20.26 description DC2_LEAF2B
   neighbor 10.255.20.27 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.27 remote-as 65203
   neighbor 10.255.20.27 description DC2_BORDER_LEAF1
   neighbor 10.255.20.28 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.28 remote-as 65203
   neighbor 10.255.20.28 description DC2_BORDER_LEAF2
   neighbor 172.31.20.83 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.83 remote-as 65201
   neighbor 172.31.20.83 description DC2_LEAF1A_Ethernet2
   neighbor 172.31.20.87 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.87 remote-as 65201
   neighbor 172.31.20.87 description DC2_LEAF1B_Ethernet2
   neighbor 172.31.20.91 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.91 remote-as 65202
   neighbor 172.31.20.91 description DC2_LEAF2A_Ethernet2
   neighbor 172.31.20.95 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.95 remote-as 65202
   neighbor 172.31.20.95 description DC2_LEAF2B_Ethernet2
   neighbor 172.31.20.99 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.99 remote-as 65203
   neighbor 172.31.20.99 description DC2_BORDER_LEAF1_Ethernet2
   neighbor 172.31.20.103 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.103 remote-as 65203
   neighbor 172.31.20.103 description DC2_BORDER_LEAF2_Ethernet2
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
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
Serial number: 5BEDAD7A383AEAACE727330FBEF20F70
Hardware MAC address: 001c.73f9.20fb
System MAC address: 001c.73f9.20fb

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 3 minutes
Total memory: 65343820 kB
Free memory: 37109588 kB
```
