# DC1_SPINE1 Commands Output

## Table of Contents

- [show lldp neighbors](#show-lldp-neighbors)
- [show ip interface brief](#show-ip-interface-brief)
- [show interfaces description](#show-interfaces-description)
- [show version](#show-version)
- [show running-config](#show-running-config)
## show interfaces description

```
Interface                      Status         Protocol           Description
Et1                            up             up                 P2P_LINK_TO_DC1_LEAF1A_Ethernet1
Et2                            up             up                 P2P_LINK_TO_DC1_LEAF1B_Ethernet1
Et3                            up             up                 P2P_LINK_TO_DC1_LEAF2A_Ethernet1
Et4                            up             up                 P2P_LINK_TO_DC1_LEAF2B_Ethernet1
Et5                            up             up                 P2P_LINK_TO_DC1_BORDER_LEAF1_Ethernet1
Et6                            up             up                 P2P_LINK_TO_DC1_BORDER_LEAF2_Ethernet1
Lo0                            up             up                 EVPN_Overlay_Peering
Ma0                            up             up                 oob_management
```
## show ip interface brief

```
Address
Interface       IP Address          Status     Protocol          MTU    Owner  
--------------- ------------------- ---------- ------------- ---------- -------
Ethernet1       172.31.10.0/31      up         up               9214           
Ethernet2       172.31.10.4/31      up         up               9214           
Ethernet3       172.31.10.8/31      up         up               9214           
Ethernet4       172.31.10.12/31     up         up               9214           
Ethernet5       172.31.10.16/31     up         up               9214           
Ethernet6       172.31.10.20/31     up         up               9214           
Loopback0       10.255.10.1/32      up         up              65535           
Management0     192.168.4.11/24     up         up               1500
```
## show lldp neighbors

```
Last table change time   : 0:02:37 ago
Number of table inserts  : 22
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC1_LEAF1A               Ethernet1           120
Et2           DC1_LEAF1B               Ethernet1           120
Et3           DC1_LEAF2A               Ethernet1           120
Et4           DC1_LEAF2B               Ethernet1           120
Et5           DC1_BORDER_LEAF1         Ethernet1           120
Et6           DC1_BORDER_LEAF2         Ethernet1           120
Ma0           dc2-client3              befa.cf8c.39a2      120
Ma0           dc2-client4              9efb.f102.3787      120
Ma0           dc1-client1              424b.386f.c649      120
Ma0           dc1-client4              928a.8772.c8eb      120
Ma0           dc1-client2              ca38.db3c.a940      120
Ma0           dc2-client1              3ebe.0ca4.39f1      120
Ma0           dc2-client2              2627.6f5f.f8ff      120
Ma0           DC2_SPINE2               Management0         120
Ma0           DC1_LEAF2A               Management0         120
Ma0           DC2_BORDER_LEAF2         Management0         120
Ma0           DC2_LEAF2B               Management0         120
Ma0           DC2_LEAF2A               Management0         120
Ma0           DC1_BORDER_LEAF1         Management0         120
Ma0           DC2_LEAF1A               Management0         120
Ma0           DC1_LEAF1A               Management0         120
Ma0           DC1_LEAF2B               Management0         120
```
## show running-config

```
! Command: show running-config
! device: DC1-SPINE1 (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
!
no aaa root
!
username admin privilege 15 role network-admin secret sha512 $6$7GTxsrRjnwheeKfR$zhJ8qycVjAJz41rf5JRSfWIzp93IL5WL7sMS/Taz1yfShz.MAnoajCf7R2n1/EZW7PN5QA3Huayl0lVQesBYN1
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
hostname DC1_SPINE1
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
interface Ethernet1
   description P2P_LINK_TO_DC1_LEAF1A_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.0/31
!
interface Ethernet2
   description P2P_LINK_TO_DC1_LEAF1B_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.4/31
!
interface Ethernet3
   description P2P_LINK_TO_DC1_LEAF2A_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.8/31
!
interface Ethernet4
   description P2P_LINK_TO_DC1_LEAF2B_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.12/31
!
interface Ethernet5
   description P2P_LINK_TO_DC1_BORDER_LEAF1_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.16/31
!
interface Ethernet6
   description P2P_LINK_TO_DC1_BORDER_LEAF2_Ethernet1
   mtu 9214
   no switchport
   ip address 172.31.10.20/31
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.10.1/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.11/24
!
ip routing
no ip routing vrf MGMT
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.10.0/24 eq 32
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
router bgp 65100
   router-id 10.255.10.1
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
   neighbor 10.255.10.3 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.3 remote-as 65101
   neighbor 10.255.10.3 description DC1_LEAF1A
   neighbor 10.255.10.4 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.4 remote-as 65101
   neighbor 10.255.10.4 description DC1_LEAF1B
   neighbor 10.255.10.5 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.5 remote-as 65102
   neighbor 10.255.10.5 description DC1_LEAF2A
   neighbor 10.255.10.6 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.6 remote-as 65102
   neighbor 10.255.10.6 description DC1_LEAF2B
   neighbor 10.255.10.7 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.7 remote-as 65103
   neighbor 10.255.10.7 description DC1_BORDER_LEAF1
   neighbor 10.255.10.8 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.8 remote-as 65103
   neighbor 10.255.10.8 description DC1_BORDER_LEAF2
   neighbor 172.31.10.1 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.1 remote-as 65101
   neighbor 172.31.10.1 description DC1_LEAF1A_Ethernet1
   neighbor 172.31.10.5 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.5 remote-as 65101
   neighbor 172.31.10.5 description DC1_LEAF1B_Ethernet1
   neighbor 172.31.10.9 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.9 remote-as 65102
   neighbor 172.31.10.9 description DC1_LEAF2A_Ethernet1
   neighbor 172.31.10.13 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.13 remote-as 65102
   neighbor 172.31.10.13 description DC1_LEAF2B_Ethernet1
   neighbor 172.31.10.17 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.17 remote-as 65103
   neighbor 172.31.10.17 description DC1_BORDER_LEAF1_Ethernet1
   neighbor 172.31.10.21 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.21 remote-as 65103
   neighbor 172.31.10.21 description DC1_BORDER_LEAF2_Ethernet1
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
   !
   address-family rt-membership
      neighbor EVPN-OVERLAY-PEERS activate
      neighbor EVPN-OVERLAY-PEERS default-route-target only
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
Serial number: 3D684A6A19279A8AF23661EC117D0A67
Hardware MAC address: 001c.731b.4353
System MAC address: 001c.731b.4353

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 4 minutes
Total memory: 65343812 kB
Free memory: 41374228 kB
```
