# DC2_LEAF2B Commands Output

## Table of Contents

- [show lldp neighbors](#show-lldp-neighbors)
- [show ip interface brief](#show-ip-interface-brief)
- [show interfaces description](#show-interfaces-description)
- [show version](#show-version)
- [show running-config](#show-running-config)
## show interfaces description

```
Interface                      Status         Protocol           Description
Et1                            up             up                 P2P_LINK_TO_DC2_SPINE1_Ethernet4
Et2                            up             up                 P2P_LINK_TO_DC2_SPINE2_Ethernet4
Et3                            up             up                 MLAG_PEER_DC2_LEAF2A_Ethernet3
Et4                            up             up                 MLAG_PEER_DC2_LEAF2A_Ethernet4
Et5                            up             up                 dc2-server03_Eth2
Et6                            up             up                 dc2-server04_Eth2
Lo0                            up             up                 EVPN_Overlay_Peering
Lo1                            up             up                 VTEP_VXLAN_Tunnel_Source
Lo110                          up             up                 RED_VTEP_DIAGNOSTICS
Lo210                          up             up                 BLUE_VTEP_DIAGNOSTICS
Ma0                            up             up                 oob_management
Po3                            up             up                 MLAG_PEER_DC2_LEAF2A_Po3
Po5                            up             up                 dc2-server03_PortChannel5
Po6                            up             up                 dc2-server04_PortChannel6
Vl122                          up             up                 VRF_RED_VLAN_122
Vl123                          up             up                 VRF_BLUE_VLAN_123
Vl1198                         up             up                 
Vl1199                         up             up                 
Vl4093                         up             up                 MLAG_PEER_L3_PEERING
Vl4094                         up             up                 MLAG_PEER
Vx1                            up             up                 DC2_LEAF2B_VTEP
```
## show ip interface brief

```
Address
Interface       IP Address          Status     Protocol          MTU    Owner  
--------------- ------------------- ---------- ------------- ---------- -------
Ethernet1       172.31.20.13/31     up         up               9214           
Ethernet2       172.31.20.15/31     up         up               9214           
Loopback0       10.255.20.6/32      up         up              65535           
Loopback1       10.255.21.5/32      up         up              65535           
Loopback110     10.255.110.6/32     up         up              65535           
Loopback210     10.255.210.6/32     up         up              65535           
Management0     192.168.4.26/24     up         up               1500           
Vlan122         10.1.22.1/24        up         up               1500           
Vlan123         10.1.23.1/24        up         up               1500           
Vlan1198        unassigned          up         up               9164           
Vlan1199        unassigned          up         up               9164           
Vlan4093        10.255.252.5/31     up         up               9214           
Vlan4094        10.255.251.5/31     up         up               9214
```
## show lldp neighbors

```
Last table change time   : 0:00:23 ago
Number of table inserts  : 25
Number of table deletes  : 3
Number of table drops    : 0
Number of table age-outs : 3

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC2_SPINE1               Ethernet4           120
Et2           DC2_SPINE2               Ethernet4           120
Et3           DC2_LEAF2A               Ethernet3           120
Et4           DC2_LEAF2A               Ethernet4           120
Et5           dc2-client3              aac1.ab6d.74f8      120
Et6           dc2-client4              aac1.abfb.5073      120
Ma0           dc2-client3              befa.cf8c.39a2      120
Ma0           dc1-client1              424b.386f.c649      120
Ma0           dc2-client4              9efb.f102.3787      120
Ma0           dc1-client2              ca38.db3c.a940      120
Ma0           dc1-client4              928a.8772.c8eb      120
Ma0           dc2-client1              3ebe.0ca4.39f1      120
Ma0           dc2-client2              2627.6f5f.f8ff      120
Ma0           DC1_SPINE2               Management0         120
Ma0           DC1_BORDER_LEAF1         Management0         120
Ma0           DC2_SPINE2               Management0         120
Ma0           DC1_LEAF1B               Management0         120
Ma0           DC2_SPINE1               Management0         120
Ma0           DC1_LEAF2B               Management0         120
Ma0           DC2_BORDER_LEAF2         Management0         120
Ma0           WAN                      Management0         120
Ma0           DC1_SPINE1               Management0         120
```
## show running-config

```
! Command: show running-config
! device: DC2-LEAF2B (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
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
hostname DC2_LEAF2B
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
vlan 122
   name VRF_RED_VLAN_122
!
vlan 123
   name VRF_BLUE_VLAN_123
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
interface Port-Channel3
   description MLAG_PEER_DC2_LEAF2A_Po3
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
!
interface Port-Channel5
   description dc2-server03_PortChannel5
   switchport trunk allowed vlan 122
   switchport mode trunk
   mlag 5
   spanning-tree portfast
!
interface Port-Channel6
   description dc2-server04_PortChannel6
   switchport trunk allowed vlan 123
   switchport mode trunk
   mlag 6
   spanning-tree portfast
!
interface Ethernet1
   description P2P_LINK_TO_DC2_SPINE1_Ethernet4
   mtu 9214
   no switchport
   ip address 172.31.20.13/31
!
interface Ethernet2
   description P2P_LINK_TO_DC2_SPINE2_Ethernet4
   mtu 9214
   no switchport
   ip address 172.31.20.15/31
!
interface Ethernet3
   description MLAG_PEER_DC2_LEAF2A_Ethernet3
   channel-group 3 mode active
!
interface Ethernet4
   description MLAG_PEER_DC2_LEAF2A_Ethernet4
   channel-group 3 mode active
!
interface Ethernet5
   description dc2-server03_Eth2
   channel-group 5 mode active
!
interface Ethernet6
   description dc2-server04_Eth2
   channel-group 6 mode active
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.20.6/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   ip address 10.255.21.5/32
!
interface Loopback110
   description RED_VTEP_DIAGNOSTICS
   vrf RED
   ip address 10.255.110.6/32
!
interface Loopback210
   description BLUE_VTEP_DIAGNOSTICS
   vrf BLUE
   ip address 10.255.210.6/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.26/24
!
interface Vlan122
   description VRF_RED_VLAN_122
   vrf RED
   ip address virtual 10.1.22.1/24
!
interface Vlan123
   description VRF_BLUE_VLAN_123
   vrf BLUE
   ip address virtual 10.1.23.1/24
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   mtu 9214
   ip address 10.255.252.5/31
!
interface Vlan4094
   description MLAG_PEER
   mtu 9214
   no autostate
   ip address 10.255.251.5/31
!
interface Vxlan1
   description DC2_LEAF2B_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 122 vni 10122
   vxlan vlan 123 vni 10123
   vxlan vrf BLUE vni 210
   vxlan vrf RED vni 110
!
ip virtual-router mac-address 02:05:02:05:02:05
ip address virtual source-nat vrf BLUE address 10.255.210.6
ip address virtual source-nat vrf RED address 10.255.110.6
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
   domain-id DC2_LEAF2
   local-interface Vlan4094
   peer-address 10.255.251.4
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
router bgp 65202
   router-id 10.255.20.6
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   maximum-paths 4 ecmp 4
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
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65202
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description DC2_LEAF2A
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor 10.255.20.1 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.1 remote-as 65200
   neighbor 10.255.20.1 description DC2_SPINE1
   neighbor 10.255.20.2 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.20.2 remote-as 65200
   neighbor 10.255.20.2 description DC2_SPINE2
   neighbor 10.255.252.4 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 10.255.252.4 description DC2_LEAF2A
   neighbor 172.31.20.12 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.12 remote-as 65200
   neighbor 172.31.20.12 description DC2_SPINE1_Ethernet4
   neighbor 172.31.20.14 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.20.14 remote-as 65200
   neighbor 172.31.20.14 description DC2_SPINE2_Ethernet4
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 122
      rd 10.255.20.6:10122
      route-target both 10122:10122
      redistribute learned
   !
   vlan 123
      rd 10.255.20.6:10123
      route-target both 10123:10123
      redistribute learned
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   address-family rt-membership
      neighbor EVPN-OVERLAY-PEERS activate
   !
   vrf BLUE
      rd 10.255.20.6:210
      route-target import evpn 210:210
      route-target export evpn 210:210
      router-id 10.255.20.6
      redistribute connected
   !
   vrf RED
      rd 10.255.20.6:110
      route-target import evpn 110:110
      route-target export evpn 110:110
      router-id 10.255.20.6
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
Serial number: 4442A02A03B643415F1C3CDF63D98AA1
Hardware MAC address: 001c.734b.1671
System MAC address: 001c.734b.1671

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 4 minutes
Total memory: 65343812 kB
Free memory: 40986628 kB
```
