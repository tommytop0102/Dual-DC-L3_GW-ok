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
Et1                            up             up                 P2P_LINK_TO_DC2_SPINE1_Ethernet5
Et2                            up             up                 P2P_LINK_TO_DC2_SPINE2_Ethernet5
Et3                            up             up                 MLAG_PEER_DC2_BORDER_LEAF2_Ethernet3
Et4                            up             up                 MLAG_PEER_DC2_BORDER_LEAF2_Ethernet4
Et5                            up             up                 P2P_LINK_TO_WAN_Ethernet3
Lo0                            up             up                 EVPN_Overlay_Peering
Lo1                            up             up                 VTEP_VXLAN_Tunnel_Source
Lo110                          up             up                 RED_VTEP_DIAGNOSTICS
Lo220                          up             up                 BLUE_VTEP_DIAGNOSTICS
Ma0                            up             up                 oob_management
Po3                            up             up                 MLAG_PEER_DC2_BORDER_LEAF2_Po3
Vl111                          up             up                 VRF_RED_VLAN_111
Vl112                          up             up                 VRF_RED_VLAN_112
Vl213                          up             up                 VRF_BLUE_VLAN_213
Vl214                          up             up                 VRF_BLUE_VLAN_214
Vl1198                         up             up                 
Vl1199                         up             up                 
Vl3109                         up             up                 MLAG_PEER_L3_iBGP: vrf RED
Vl3219                         up             up                 MLAG_PEER_L3_iBGP: vrf BLUE
Vl4093                         up             up                 MLAG_PEER_L3_PEERING
Vl4094                         up             up                 MLAG_PEER
Vx1                            up             up                 DC2_BORDER_LEAF1_VTEP
```
## show ip interface brief

```
Address
Interface       IP Address           Status     Protocol         MTU    Owner  
--------------- -------------------- ---------- ------------ ---------- -------
Ethernet1       172.31.20.97/31      up         up              9214           
Ethernet2       172.31.20.99/31      up         up              9214           
Ethernet5       172.16.30.4/31       up         up              9214           
Loopback0       10.255.20.27/32      up         up             65535           
Loopback1       10.255.21.27/32      up         up             65535           
Loopback110     10.255.110.27/32     up         up             65535           
Loopback220     10.255.220.27/32     up         up             65535           
Management0     192.168.4.27/24      up         up              1500           
Vlan111         10.1.11.1/24         up         up              1500           
Vlan112         10.1.12.1/24         up         up              1500           
Vlan213         10.2.13.1/24         up         up              1500           
Vlan214         10.2.14.1/24         up         up              1500           
Vlan1198        unassigned           up         up              9164           
Vlan1199        unassigned           up         up              9164           
Vlan3109        10.255.252.48/31     up         up              9214           
Vlan3219        10.255.252.48/31     up         up              9214           
Vlan4093        10.255.252.48/31     up         up              9214           
Vlan4094        10.255.251.48/31     up         up              9214
```
## show lldp neighbors

```
Last table change time   : 0:00:12 ago
Number of table inserts  : 21
Number of table deletes  : 0
Number of table drops    : 0
Number of table age-outs : 0

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC2_SPINE1               Ethernet5           120
Et2           DC2_SPINE2               Ethernet5           120
Et3           DC2_BORDER_LEAF2         Ethernet3           120
Et4           DC2_BORDER_LEAF2         Ethernet4           120
Et5           WAN                      Ethernet3           120
Ma0           dc2-client4              Management0         120
Ma0           DC2_SPINE1               Management0         120
Ma0           dc2-client3              Management0         120
Ma0           dc1-client1              Management0         120
Ma0           dc1-client2              Management0         120
Ma0           DC1_SPINE1               Management0         120
Ma0           dc2-client1              Management0         120
Ma0           dc1-client4              Management0         120
Ma0           dc1-client3              Management0         120
Ma0           DC2_LEAF1A               Management0         120
Ma0           DC1_LEAF2B               Management0         120
Ma0           DC1_SPINE2               Management0         120
Ma0           DC2_LEAF2B               Management0         120
Ma0           DC2_SPINE2               Management0         120
Ma0           DC1_LEAF2A               Management0         120
Ma0           DC2_LEAF1B               Management0         120
```
## show running-config

```
! Command: show running-config
! device: DC2-BORDER-LEAF1 (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
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
hostname DC2_BORDER_LEAF1
ip name-server vrf MGMT 1.1.1.1
ip name-server vrf MGMT 8.8.8.8
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree mst 0 priority 4096
!
system l1
   unsupported speed action error
   unsupported error-correction action error
!
vlan 111
   name VRF_RED_VLAN_111
!
vlan 112
   name VRF_RED_VLAN_112
!
vlan 120
   name Motion_VLAN_120
!
vlan 213
   name VRF_BLUE_VLAN_213
!
vlan 214
   name VRF_BLUE_VLAN_214
!
vlan 3109
   name MLAG_iBGP_RED
   trunk group LEAF_PEER_L3
!
vlan 3219
   name MLAG_iBGP_BLUE
   trunk group LEAF_PEER_L3
!
vlan 4093
   name LEAF_PEER_L3
   trunk group LEAF_PEER_L3
!
vlan 4094
   name MLAG_PEER
   trunk group MLAG
!
vrf instance BLUE
!
vrf instance MGMT
!
vrf instance RED
!
aaa authorization exec default local
!
interface Port-Channel3
   description MLAG_PEER_DC2_BORDER_LEAF2_Po3
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
!
interface Ethernet1
   description P2P_LINK_TO_DC2_SPINE1_Ethernet5
   mtu 9214
   no switchport
   ip address 172.31.20.97/31
!
interface Ethernet2
   description P2P_LINK_TO_DC2_SPINE2_Ethernet5
   mtu 9214
   no switchport
   ip address 172.31.20.99/31
!
interface Ethernet3
   description MLAG_PEER_DC2_BORDER_LEAF2_Ethernet3
   channel-group 3 mode active
!
interface Ethernet4
   description MLAG_PEER_DC2_BORDER_LEAF2_Ethernet4
   channel-group 3 mode active
!
interface Ethernet5
   description P2P_LINK_TO_WAN_Ethernet3
   mtu 9214
   no switchport
   ip address 172.16.30.4/31
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.20.27/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   ip address 10.255.21.27/32
!
interface Loopback110
   description RED_VTEP_DIAGNOSTICS
   vrf RED
   ip address 10.255.110.27/32
!
interface Loopback220
   description BLUE_VTEP_DIAGNOSTICS
   vrf BLUE
   ip address 10.255.220.27/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.27/24
!
interface Vlan111
   description VRF_RED_VLAN_111
   vrf RED
   ip address virtual 10.1.11.1/24
!
interface Vlan112
   description VRF_RED_VLAN_112
   vrf RED
   ip address virtual 10.1.12.1/24
!
interface Vlan213
   description VRF_BLUE_VLAN_213
   vrf BLUE
   ip address virtual 10.2.13.1/24
!
interface Vlan214
   description VRF_BLUE_VLAN_214
   vrf BLUE
   ip address virtual 10.2.14.1/24
!
interface Vlan3109
   description MLAG_PEER_L3_iBGP: vrf RED
   mtu 9214
   vrf RED
   ip address 10.255.252.48/31
!
interface Vlan3219
   description MLAG_PEER_L3_iBGP: vrf BLUE
   mtu 9214
   vrf BLUE
   ip address 10.255.252.48/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   mtu 9214
   ip address 10.255.252.48/31
!
interface Vlan4094
   description MLAG_PEER
   mtu 9214
   no autostate
   ip address 10.255.251.48/31
!
interface Vxlan1
   description DC2_BORDER_LEAF1_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 111 vni 10111
   vxlan vlan 112 vni 10112
   vxlan vlan 120 vni 55120
   vxlan vlan 213 vni 10213
   vxlan vlan 214 vni 10214
   vxlan vrf BLUE vni 220
   vxlan vrf RED vni 110
!
ip virtual-router mac-address 02:05:02:05:02:05
ip address virtual source-nat vrf BLUE address 10.255.220.27
ip address virtual source-nat vrf RED address 10.255.110.27
!
ip routing
ip routing vrf BLUE
no ip routing vrf MGMT
ip routing vrf RED
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.20.0/24 eq 32
   seq 20 permit 10.255.21.0/24 eq 32
!
mlag configuration
   domain-id DC2_BORDER_LEAVES
   local-interface Vlan4094
   peer-address 10.255.251.49
   peer-link Port-Channel3
   reload-delay mlag 300
   reload-delay non-mlag 330
!
ip route vrf MGMT 0.0.0.0/0 192.168.4.1
!
ntp server vrf MGMT time.google.com prefer iburst
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
!
router bgp 65203
   router-id 10.255.20.27
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   maximum-paths 4 ecmp 4
   neighbor EVPN-OVERLAY-CORE peer group
   neighbor EVPN-OVERLAY-CORE update-source Loopback0
   neighbor EVPN-OVERLAY-CORE bfd
   neighbor EVPN-OVERLAY-CORE ebgp-multihop 15
   neighbor EVPN-OVERLAY-CORE send-community
   neighbor EVPN-OVERLAY-CORE maximum-routes 0
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER peer group
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65203
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description DC2_BORDER_LEAF2
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor 10.255.10.17 peer group EVPN-OVERLAY-CORE
   neighbor 10.255.10.17 remote-as 65103
   neighbor 10.255.10.17 description DC1_BORDER_LEAF1
   neighbor 10.255.10.18 peer group EVPN-OVERLAY-CORE
   neighbor 10.255.10.18 remote-as 65103
   neighbor 10.255.10.18 description DC1_BORDER_LEAF2
   neighbor 10.255.20.3 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.3 remote-as 65200
   neighbor 10.255.20.3 description DC2_SPINE1
   neighbor 10.255.20.4 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.4 remote-as 65200
   neighbor 10.255.20.4 description DC2_SPINE2
   neighbor 10.255.252.49 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 10.255.252.49 description DC2_BORDER_LEAF2
   neighbor 172.16.30.5 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.16.30.5 remote-as 65300
   neighbor 172.16.30.5 description WAN
   neighbor 172.31.20.96 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.96 remote-as 65200
   neighbor 172.31.20.96 description DC2_SPINE1_Ethernet5
   neighbor 172.31.20.98 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.98 remote-as 65200
   neighbor 172.31.20.98 description DC2_SPINE2_Ethernet5
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 111
      rd 10.255.20.27:10111
      rd evpn domain remote 10.255.20.27:10111
      route-target both 10111:10111
      route-target import export evpn domain remote 10111:10111
      redistribute learned
   !
   vlan 112
      rd 10.255.20.27:10112
      rd evpn domain remote 10.255.20.27:10112
      route-target both 10112:10112
      route-target import export evpn domain remote 10112:10112
      redistribute learned
   !
   vlan 120
      rd 10.255.20.27:55120
      rd evpn domain remote 10.255.20.27:55120
      route-target both 55120:55120
      route-target import export evpn domain remote 55120:55120
      redistribute learned
   !
   vlan 213
      rd 10.255.20.27:10213
      rd evpn domain remote 10.255.20.27:10213
      route-target both 10213:10213
      route-target import export evpn domain remote 10213:10213
      redistribute learned
   !
   vlan 214
      rd 10.255.20.27:10214
      rd evpn domain remote 10.255.20.27:10214
      route-target both 10214:10214
      route-target import export evpn domain remote 10214:10214
      redistribute learned
   !
   address-family evpn
      neighbor EVPN-OVERLAY-CORE activate
      neighbor EVPN-OVERLAY-CORE domain remote
      neighbor EVPN-OVERLAY-PEERS activate
      neighbor default next-hop-self received-evpn-routes route-type ip-prefix inter-domain
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-CORE activate
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   address-family rt-membership
      neighbor EVPN-OVERLAY-CORE activate
      neighbor EVPN-OVERLAY-PEERS activate
   !
   vrf BLUE
      rd 10.255.20.27:220
      route-target import evpn 110:110
      route-target import evpn 220:220
      route-target export evpn 110:110
      route-target export evpn 220:220
      router-id 10.255.20.27
      neighbor 10.255.252.49 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
   !
   vrf RED
      rd 10.255.20.27:110
      route-target import evpn 110:110
      route-target import evpn 220:220
      route-target export evpn 110:110
      route-target export evpn 220:220
      router-id 10.255.20.27
      neighbor 10.255.252.49 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
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
Serial number: C9B165246A01B55DF8A0C8007432E0BC
Hardware MAC address: 001c.73a5.c102
System MAC address: 001c.73a5.c102

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 3 minutes
Total memory: 65343820 kB
Free memory: 37169420 kB
```
