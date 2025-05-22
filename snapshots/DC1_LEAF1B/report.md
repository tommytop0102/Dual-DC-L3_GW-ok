# DC1_LEAF1B Commands Output

## Table of Contents

- [show lldp neighbors](#show-lldp-neighbors)
- [show ip interface brief](#show-ip-interface-brief)
- [show interfaces description](#show-interfaces-description)
- [show version](#show-version)
- [show running-config](#show-running-config)
## show interfaces description

```
Interface                      Status         Protocol           Description
Et1                            up             up                 P2P_LINK_TO_DC1_SPINE1_Ethernet2
Et2                            up             up                 P2P_LINK_TO_DC1_SPINE2_Ethernet2
Et3                            up             up                 MLAG_PEER_DC1_LEAF1A_Ethernet3
Et4                            up             up                 MLAG_PEER_DC1_LEAF1A_Ethernet4
Et5                            up             up                 Routed_Interface_E5_To_DC1-CLIENT2
Et6                            up             up                 
Lo0                            up             up                 EVPN_Overlay_Peering
Lo1                            up             up                 VTEP_VXLAN_Tunnel_Source
Lo110                          up             up                 RED_VTEP_DIAGNOSTICS
Lo210                          up             up                 BLUE_VTEP_DIAGNOSTICS
Ma0                            up             up                 oob_management
Po3                            up             up                 MLAG_PEER_DC1_LEAF1A_Po3
Vl110                          up             up                 VRF_RED_VLAN_110
Vl112                          up             up                 VRF_RED_VLAN_112
Vl120                          up             up                 VRF_RED_VLAN_120
Vl122                          up             up                 VRF_RED_VLAN_122
Vl211                          up             up                 VRF_BLUE_VLAN_211
Vl213                          up             up                 VRF_BLUE_VLAN_213
Vl221                          up             up                 VRF_BLUE_VLAN_221
Vl223                          up             up                 VRF_BLUE_VLAN_223
Vl1198                         up             up                 
Vl1199                         up             up                 
Vl3109                         up             up                 MLAG_PEER_L3_iBGP: vrf RED
Vl3209                         up             up                 MLAG_PEER_L3_iBGP: vrf BLUE
Vl4093                         up             up                 MLAG_PEER_L3_PEERING
Vl4094                         up             up                 MLAG_PEER
Vx1                            up             up                 DC1_LEAF1B_VTEP
```
## show ip interface brief

```
Address
Interface       IP Address           Status     Protocol         MTU    Owner  
--------------- -------------------- ---------- ------------ ---------- -------
Ethernet1       172.31.10.45/31      up         up              9214           
Ethernet2       172.31.10.47/31      up         up              9214           
Ethernet5       10.192.195.21/24     up         up              9000           
Loopback0       10.255.10.14/32      up         up             65535           
Loopback1       10.255.11.13/32      up         up             65535           
Loopback110     10.255.110.14/32     up         up             65535           
Loopback210     10.255.210.14/32     up         up             65535           
Management0     192.168.4.14/24      up         up              1500           
Vlan110         10.1.10.1/24         up         up              1500           
Vlan112         10.1.12.1/24         up         up              1500           
Vlan120         10.1.20.1/24         up         up              1500           
Vlan122         10.1.22.1/24         up         up              1500           
Vlan211         10.2.11.1/24         up         up              1500           
Vlan213         10.2.13.1/24         up         up              1500           
Vlan221         10.2.21.1/24         up         up              1500           
Vlan223         10.2.23.1/24         up         up              1500           
Vlan1198        unassigned           up         up              9164           
Vlan1199        unassigned           up         up              9164           
Vlan3109        10.255.242.21/31     up         up              9214           
Vlan3209        10.255.242.21/31     up         up              9214           
Vlan4093        10.255.242.21/31     up         up              9214           
Vlan4094        10.255.241.21/31     up         up              9214
```
## show lldp neighbors

```
Last table change time   : 0:04:54 ago
Number of table inserts  : 23
Number of table deletes  : 1
Number of table drops    : 0
Number of table age-outs : 1

Port          Neighbor Device ID       Neighbor Port ID    TTL
---------- ------------------------ ---------------------- ---
Et1           DC1_SPINE1               Ethernet2           120
Et2           DC1_SPINE2               Ethernet2           120
Et3           DC1_LEAF1A               Ethernet3           120
Et4           DC1_LEAF1A               Ethernet4           120
Et5           dc1-client1              Ethernet2           120
Et6           dc1-client2              Ethernet2           120
Ma0           dc1-client4              Management0         120
Ma0           dc2-client1              Management0         120
Ma0           dc2-client3              Management0         120
Ma0           DC1_LEAF2B               Management0         120
Ma0           dc2-client4              Management0         120
Ma0           dc2-client2              Management0         120
Ma0           DC2_BORDER_LEAF2         Management0         120
Ma0           DC1_SPINE1               Management0         120
Ma0           dc1-client1              Management0         120
Ma0           dc1-client2              Management0         120
Ma0           DC2_LEAF2A               Management0         120
Ma0           DC1_SPINE2               Management0         120
Ma0           dc1-client3              Management0         120
Ma0           DC2_LEAF1A               Management0         120
Ma0           DC2_BORDER_LEAF1         Management0         120
Ma0           DC2_LEAF1B               Management0         120
```
## show running-config

```
! Command: show running-config
! device: DC1-LEAF1B (cEOSLab, EOS-4.32.5M-41241764.4325M (engineering build))
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
hostname DC1_LEAF1B
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
vlan 110
   name VRF_RED_VLAN_110
!
vlan 112
   name VRF_RED_VLAN_112
!
vlan 120
   name VRF_RED_VLAN_120
!
vlan 122
   name VRF_RED_VLAN_122
!
vlan 211
   name VRF_BLUE_VLAN_211
!
vlan 213
   name VRF_BLUE_VLAN_213
!
vlan 221
   name VRF_BLUE_VLAN_221
!
vlan 223
   name VRF_BLUE_VLAN_223
!
vlan 3109
   name MLAG_iBGP_RED
   trunk group LEAF_PEER_L3
!
vlan 3209
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
   description MLAG_PEER_DC1_LEAF1A_Po3
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
!
interface Ethernet1
   description P2P_LINK_TO_DC1_SPINE1_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.10.45/31
!
interface Ethernet2
   description P2P_LINK_TO_DC1_SPINE2_Ethernet2
   mtu 9214
   no switchport
   ip address 172.31.10.47/31
!
interface Ethernet3
   description MLAG_PEER_DC1_LEAF1A_Ethernet3
   channel-group 3 mode active
!
interface Ethernet4
   description MLAG_PEER_DC1_LEAF1A_Ethernet4
   channel-group 3 mode active
!
interface Ethernet5
   description Routed_Interface_E5_To_DC1-CLIENT2
   mtu 9000
   no switchport
   vrf BLUE
   ip address 10.192.195.21/24
!
interface Ethernet6
!
interface Loopback0
   description EVPN_Overlay_Peering
   ip address 10.255.10.14/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   ip address 10.255.11.13/32
!
interface Loopback110
   description RED_VTEP_DIAGNOSTICS
   vrf RED
   ip address 10.255.110.14/32
!
interface Loopback210
   description BLUE_VTEP_DIAGNOSTICS
   vrf BLUE
   ip address 10.255.210.14/32
!
interface Management0
   description oob_management
   vrf MGMT
   ip address 192.168.4.14/24
!
interface Vlan110
   description VRF_RED_VLAN_110
   vrf RED
   ip address virtual 10.1.10.1/24
!
interface Vlan112
   description VRF_RED_VLAN_112
   vrf RED
   ip address virtual 10.1.12.1/24
!
interface Vlan120
   description VRF_RED_VLAN_120
   vrf RED
   ip address virtual 10.1.20.1/24
!
interface Vlan122
   description VRF_RED_VLAN_122
   vrf RED
   ip address virtual 10.1.22.1/24
!
interface Vlan211
   description VRF_BLUE_VLAN_211
   vrf BLUE
   ip address virtual 10.2.11.1/24
!
interface Vlan213
   description VRF_BLUE_VLAN_213
   vrf BLUE
   ip address virtual 10.2.13.1/24
!
interface Vlan221
   description VRF_BLUE_VLAN_221
   vrf BLUE
   ip address virtual 10.2.21.1/24
!
interface Vlan223
   description VRF_BLUE_VLAN_223
   vrf BLUE
   ip address virtual 10.2.23.1/24
!
interface Vlan3109
   description MLAG_PEER_L3_iBGP: vrf RED
   mtu 9214
   vrf RED
   ip address 10.255.242.21/31
!
interface Vlan3209
   description MLAG_PEER_L3_iBGP: vrf BLUE
   mtu 9214
   vrf BLUE
   ip address 10.255.242.21/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   mtu 9214
   ip address 10.255.242.21/31
!
interface Vlan4094
   description MLAG_PEER
   mtu 9214
   no autostate
   ip address 10.255.241.21/31
!
interface Vxlan1
   description DC1_LEAF1B_VTEP
   vxlan source-interface Loopback1
   vxlan virtual-router encapsulation mac-address mlag-system-id
   vxlan udp-port 4789
   vxlan vlan 110 vni 10110
   vxlan vlan 112 vni 10112
   vxlan vlan 120 vni 10120
   vxlan vlan 122 vni 10122
   vxlan vlan 211 vni 10211
   vxlan vlan 213 vni 10213
   vxlan vlan 221 vni 10221
   vxlan vlan 223 vni 10223
   vxlan vrf BLUE vni 210
   vxlan vrf RED vni 110
!
ip virtual-router mac-address 02:04:02:04:02:04
ip address virtual source-nat vrf BLUE address 10.255.210.14
ip address virtual source-nat vrf RED address 10.255.110.14
!
ip routing
ip routing vrf BLUE
no ip routing vrf MGMT
ip routing vrf RED
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.10.0/24 eq 32
   seq 20 permit 10.255.11.0/24 eq 32
!
mlag configuration
   domain-id DC1_LEAF1
   local-interface Vlan4094
   peer-address 10.255.241.20
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
router bgp 65101
   router-id 10.255.10.14
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
   neighbor MLAG-IPv4-UNDERLAY-PEER remote-as 65101
   neighbor MLAG-IPv4-UNDERLAY-PEER next-hop-self
   neighbor MLAG-IPv4-UNDERLAY-PEER description DC1_LEAF1A
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor 10.255.10.1 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.1 remote-as 65100
   neighbor 10.255.10.1 description DC1_SPINE1
   neighbor 10.255.10.2 peer group EVPN-OVERLAY-PEERS
   neighbor 10.255.10.2 remote-as 65100
   neighbor 10.255.10.2 description DC1_SPINE2
   neighbor 10.255.242.20 peer group MLAG-IPv4-UNDERLAY-PEER
   neighbor 10.255.242.20 description DC1_LEAF1A
   neighbor 172.31.10.44 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.44 remote-as 65100
   neighbor 172.31.10.44 description DC1_SPINE1_Ethernet2
   neighbor 172.31.10.46 peer group IPv4-UNDERLAY-PEERS
   neighbor 172.31.10.46 remote-as 65100
   neighbor 172.31.10.46 description DC1_SPINE2_Ethernet2
   redistribute connected route-map RM-CONN-2-BGP
   !
   vlan 110
      rd 10.255.10.14:10110
      route-target both 10110:10110
      redistribute learned
   !
   vlan 112
      rd 10.255.10.14:10112
      route-target both 10112:10112
      redistribute learned
   !
   vlan 120
      rd 10.255.10.14:10120
      route-target both 10120:10120
      redistribute learned
   !
   vlan 122
      rd 10.255.10.14:10122
      route-target both 10122:10122
      redistribute learned
   !
   vlan 211
      rd 10.255.10.14:10211
      route-target both 10211:10211
      redistribute learned
   !
   vlan 213
      rd 10.255.10.14:10213
      route-target both 10213:10213
      redistribute learned
   !
   vlan 221
      rd 10.255.10.14:10221
      route-target both 10221:10221
      redistribute learned
   !
   vlan 223
      rd 10.255.10.14:10223
      route-target both 10223:10223
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
      rd 10.255.10.14:210
      route-target import evpn 210:210
      route-target export evpn 210:210
      router-id 10.255.10.14
      neighbor 10.255.242.20 peer group MLAG-IPv4-UNDERLAY-PEER
      redistribute connected
   !
   vrf RED
      rd 10.255.10.14:110
      route-target import evpn 110:110
      route-target export evpn 110:110
      router-id 10.255.10.14
      neighbor 10.255.242.20 peer group MLAG-IPv4-UNDERLAY-PEER
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
Serial number: 40DEBAF1BA95AE5CBD1DE556DE5788FF
Hardware MAC address: 001c.7329.bfa2
System MAC address: 001c.7329.bfa2

Software image version: 4.32.5M-41241764.4325M (engineering build)
Architecture: i686
Internal build version: 4.32.5M-41241764.4325M
Internal build ID: 87202da1-0950-4b8e-bc43-1af79e2e86eb
Image format version: 1.0
Image optimization: None

Kernel version: 6.8.0-59-generic

Uptime: 9 minutes
Total memory: 65343808 kB
Free memory: 36504600 kB
```
