# DC2_BORDER_LEAF1

## Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [IP Name Servers](#ip-name-servers)
  - [NTP](#ntp)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [AAA Authentication](#aaa-authentication)
  - [AAA Authorization](#aaa-authorization)
- [MLAG](#mlag)
  - [MLAG Summary](#mlag-summary)
  - [MLAG Device Configuration](#mlag-device-configuration)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Device Configuration](#internal-vlan-allocation-policy-device-configuration)
- [VLANs](#vlans)
  - [VLANs Summary](#vlans-summary)
  - [VLANs Device Configuration](#vlans-device-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Port-Channel Interfaces](#port-channel-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
  - [VLAN Interfaces](#vlan-interfaces)
  - [VXLAN Interface](#vxlan-interface)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [Virtual Router MAC Address](#virtual-router-mac-address)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [Multicast](#multicast)
  - [IP IGMP Snooping](#ip-igmp-snooping)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [Virtual Source NAT](#virtual-source-nat)
  - [Virtual Source NAT Summary](#virtual-source-nat-summary)
  - [Virtual Source NAT Configuration](#virtual-source-nat-configuration)

## Management

### Management Interfaces

#### Management Interfaces Summary

##### IPv4

| Management Interface | Description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management0 | oob_management | oob | MGMT | 192.168.4.27/24 | 192.168.4.1 |

##### IPv6

| Management Interface | Description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management0 | oob_management | oob | MGMT | - | - |

#### Management Interfaces Device Configuration

```eos
!
interface Management0
   description oob_management
   no shutdown
   vrf MGMT
   ip address 192.168.4.27/24
```

### IP Name Servers

#### IP Name Servers Summary

| Name Server | VRF | Priority |
| ----------- | --- | -------- |
| 1.1.1.1 | MGMT | - |
| 8.8.8.8 | MGMT | - |

#### IP Name Servers Device Configuration

```eos
ip name-server vrf MGMT 1.1.1.1
ip name-server vrf MGMT 8.8.8.8
```

### NTP

#### NTP Summary

##### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| time.google.com | MGMT | True | - | True | - | - | - | - | - |

#### NTP Device Configuration

```eos
!
ntp server vrf MGMT time.google.com prefer iburst
```

### Management API HTTP

#### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

#### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| MGMT | - | - |

#### Management API HTTP Device Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf MGMT
      no shutdown
```

## Authentication

### Local Users

#### Local Users Summary

| User | Privilege | Role | Disabled | Shell |
| ---- | --------- | ---- | -------- | ----- |
| admin | 15 | network-admin | False | - |
| coder | 15 | network-admin | False | - |

#### Local Users Device Configuration

```eos
!
username admin privilege 15 role network-admin secret sha512 <removed>
username coder privilege 15 role network-admin nopassword
```

### AAA Authentication

#### AAA Authentication Summary

| Type | Sub-type | User Stores |
| ---- | -------- | ---------- |
| Login | default | local |

Policy local allow-nopassword-remote-login has been enabled.

#### AAA Authentication Device Configuration

```eos
aaa authentication login default local
aaa authentication policy local allow-nopassword-remote-login
!
```

### AAA Authorization

#### AAA Authorization Summary

| Type | User Stores |
| ---- | ----------- |
| Exec | local |

Authorization for configuration commands is disabled.

#### AAA Authorization Device Configuration

```eos
aaa authorization exec default local
!
```

## MLAG

### MLAG Summary

| Domain-id | Local-interface | Peer-address | Peer-link |
| --------- | --------------- | ------------ | --------- |
| DC2_BORDER_LEAVES | Vlan4094 | 10.255.251.49 | Port-Channel3 |

Dual primary detection is disabled.

### MLAG Device Configuration

```eos
!
mlag configuration
   domain-id DC2_BORDER_LEAVES
   local-interface Vlan4094
   peer-address 10.255.251.49
   peer-link Port-Channel3
   reload-delay mlag 300
   reload-delay non-mlag 330
```

## Spanning Tree

### Spanning Tree Summary

STP mode: **mstp**

#### MSTP Instance and Priority

| Instance(s) | Priority |
| -------- | -------- |
| 0 | 4096 |

#### Global Spanning-Tree Settings

- Spanning Tree disabled for VLANs: **4093-4094**

### Spanning Tree Device Configuration

```eos
!
spanning-tree mode mstp
no spanning-tree vlan-id 4093-4094
spanning-tree mst 0 priority 4096
```

## Internal VLAN Allocation Policy

### Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

### Internal VLAN Allocation Policy Device Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

## VLANs

### VLANs Summary

| VLAN ID | Name | Trunk Groups |
| ------- | ---- | ------------ |
| 111 | VRF_RED_VLAN_111 | - |
| 112 | VRF_RED_VLAN_112 | - |
| 120 | Motion_VLAN_120 | - |
| 213 | VRF_BLUE_VLAN_213 | - |
| 214 | VRF_BLUE_VLAN_214 | - |
| 3109 | MLAG_iBGP_RED | LEAF_PEER_L3 |
| 3219 | MLAG_iBGP_BLUE | LEAF_PEER_L3 |
| 4093 | LEAF_PEER_L3 | LEAF_PEER_L3 |
| 4094 | MLAG_PEER | MLAG |

### VLANs Device Configuration

```eos
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
```

## Interfaces

### Ethernet Interfaces

#### Ethernet Interfaces Summary

##### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |
| Ethernet3 | MLAG_PEER_DC2_BORDER_LEAF2_Ethernet3 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 3 |
| Ethernet4 | MLAG_PEER_DC2_BORDER_LEAF2_Ethernet4 | *trunk | *- | *- | *['LEAF_PEER_L3', 'MLAG'] | 3 |

*Inherited from Port-Channel Interface

##### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1 | P2P_LINK_TO_DC2_SPINE1_Ethernet5 | routed | - | 172.31.20.97/31 | default | 9214 | False | - | - |
| Ethernet2 | P2P_LINK_TO_DC2_SPINE2_Ethernet5 | routed | - | 172.31.20.99/31 | default | 9214 | False | - | - |
| Ethernet5 | P2P_LINK_TO_WAN_Ethernet3 | routed | - | 172.16.30.4/31 | default | 9214 | False | - | - |

#### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_DC2_SPINE1_Ethernet5
   no shutdown
   mtu 9214
   no switchport
   ip address 172.31.20.97/31
!
interface Ethernet2
   description P2P_LINK_TO_DC2_SPINE2_Ethernet5
   no shutdown
   mtu 9214
   no switchport
   ip address 172.31.20.99/31
!
interface Ethernet3
   description MLAG_PEER_DC2_BORDER_LEAF2_Ethernet3
   no shutdown
   channel-group 3 mode active
!
interface Ethernet4
   description MLAG_PEER_DC2_BORDER_LEAF2_Ethernet4
   no shutdown
   channel-group 3 mode active
!
interface Ethernet5
   description P2P_LINK_TO_WAN_Ethernet3
   no shutdown
   mtu 9214
   no switchport
   ip address 172.16.30.4/31
```

### Port-Channel Interfaces

#### Port-Channel Interfaces Summary

##### L2

| Interface | Description | Type | Mode | VLANs | Native VLAN | Trunk Group | LACP Fallback Timeout | LACP Fallback Mode | MLAG ID | EVPN ESI |
| --------- | ----------- | ---- | ---- | ----- | ----------- | ------------| --------------------- | ------------------ | ------- | -------- |
| Port-Channel3 | MLAG_PEER_DC2_BORDER_LEAF2_Po3 | switched | trunk | - | - | ['LEAF_PEER_L3', 'MLAG'] | - | - | - | - |

#### Port-Channel Interfaces Device Configuration

```eos
!
interface Port-Channel3
   description MLAG_PEER_DC2_BORDER_LEAF2_Po3
   no shutdown
   switchport
   switchport mode trunk
   switchport trunk group LEAF_PEER_L3
   switchport trunk group MLAG
```

### Loopback Interfaces

#### Loopback Interfaces Summary

##### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 10.255.20.27/32 |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | 10.255.21.27/32 |
| Loopback110 | RED_VTEP_DIAGNOSTICS | RED | 10.255.110.27/32 |
| Loopback220 | BLUE_VTEP_DIAGNOSTICS | BLUE | 10.255.220.27/32 |

##### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |
| Loopback1 | VTEP_VXLAN_Tunnel_Source | default | - |
| Loopback110 | RED_VTEP_DIAGNOSTICS | RED | - |
| Loopback220 | BLUE_VTEP_DIAGNOSTICS | BLUE | - |

#### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 10.255.20.27/32
!
interface Loopback1
   description VTEP_VXLAN_Tunnel_Source
   no shutdown
   ip address 10.255.21.27/32
!
interface Loopback110
   description RED_VTEP_DIAGNOSTICS
   no shutdown
   vrf RED
   ip address 10.255.110.27/32
!
interface Loopback220
   description BLUE_VTEP_DIAGNOSTICS
   no shutdown
   vrf BLUE
   ip address 10.255.220.27/32
```

### VLAN Interfaces

#### VLAN Interfaces Summary

| Interface | Description | VRF |  MTU | Shutdown |
| --------- | ----------- | --- | ---- | -------- |
| Vlan111 | VRF_RED_VLAN_111 | RED | - | False |
| Vlan112 | VRF_RED_VLAN_112 | RED | - | False |
| Vlan213 | VRF_BLUE_VLAN_213 | BLUE | - | False |
| Vlan214 | VRF_BLUE_VLAN_214 | BLUE | - | False |
| Vlan3109 | MLAG_PEER_L3_iBGP: vrf RED | RED | 9214 | False |
| Vlan3219 | MLAG_PEER_L3_iBGP: vrf BLUE | BLUE | 9214 | False |
| Vlan4093 | MLAG_PEER_L3_PEERING | default | 9214 | False |
| Vlan4094 | MLAG_PEER | default | 9214 | False |

##### IPv4

| Interface | VRF | IP Address | IP Address Virtual | IP Router Virtual Address | VRRP | ACL In | ACL Out |
| --------- | --- | ---------- | ------------------ | ------------------------- | ---- | ------ | ------- |
| Vlan111 |  RED  |  -  |  10.1.11.1/24  |  -  |  -  |  -  |  -  |
| Vlan112 |  RED  |  -  |  10.1.12.1/24  |  -  |  -  |  -  |  -  |
| Vlan213 |  BLUE  |  -  |  10.2.13.1/24  |  -  |  -  |  -  |  -  |
| Vlan214 |  BLUE  |  -  |  10.2.14.1/24  |  -  |  -  |  -  |  -  |
| Vlan3109 |  RED  |  10.255.252.48/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan3219 |  BLUE  |  10.255.252.48/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4093 |  default  |  10.255.252.48/31  |  -  |  -  |  -  |  -  |  -  |
| Vlan4094 |  default  |  10.255.251.48/31  |  -  |  -  |  -  |  -  |  -  |

#### VLAN Interfaces Device Configuration

```eos
!
interface Vlan111
   description VRF_RED_VLAN_111
   no shutdown
   vrf RED
   ip address virtual 10.1.11.1/24
!
interface Vlan112
   description VRF_RED_VLAN_112
   no shutdown
   vrf RED
   ip address virtual 10.1.12.1/24
!
interface Vlan213
   description VRF_BLUE_VLAN_213
   no shutdown
   vrf BLUE
   ip address virtual 10.2.13.1/24
!
interface Vlan214
   description VRF_BLUE_VLAN_214
   no shutdown
   vrf BLUE
   ip address virtual 10.2.14.1/24
!
interface Vlan3109
   description MLAG_PEER_L3_iBGP: vrf RED
   no shutdown
   mtu 9214
   vrf RED
   ip address 10.255.252.48/31
!
interface Vlan3219
   description MLAG_PEER_L3_iBGP: vrf BLUE
   no shutdown
   mtu 9214
   vrf BLUE
   ip address 10.255.252.48/31
!
interface Vlan4093
   description MLAG_PEER_L3_PEERING
   no shutdown
   mtu 9214
   ip address 10.255.252.48/31
!
interface Vlan4094
   description MLAG_PEER
   no shutdown
   mtu 9214
   no autostate
   ip address 10.255.251.48/31
```

### VXLAN Interface

#### VXLAN Interface Summary

| Setting | Value |
| ------- | ----- |
| Source Interface | Loopback1 |
| UDP port | 4789 |
| EVPN MLAG Shared Router MAC | mlag-system-id |

##### VLAN to VNI, Flood List and Multicast Group Mappings

| VLAN | VNI | Flood List | Multicast Group |
| ---- | --- | ---------- | --------------- |
| 111 | 10111 | - | - |
| 112 | 10112 | - | - |
| 120 | 55120 | - | - |
| 213 | 10213 | - | - |
| 214 | 10214 | - | - |

##### VRF to VNI and Multicast Group Mappings

| VRF | VNI | Multicast Group |
| ---- | --- | --------------- |
| BLUE | 220 | - |
| RED | 110 | - |

#### VXLAN Interface Device Configuration

```eos
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
```

## Routing

### Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

### Virtual Router MAC Address

#### Virtual Router MAC Address Summary

Virtual Router MAC Address: 02:05:02:05:02:05

#### Virtual Router MAC Address Device Configuration

```eos
!
ip virtual-router mac-address 02:05:02:05:02:05
```

### IP Routing

#### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | True |
| BLUE | True |
| MGMT | False |
| RED | True |

#### IP Routing Device Configuration

```eos
!
ip routing
ip routing vrf BLUE
no ip routing vrf MGMT
ip routing vrf RED
```

### IPv6 Routing

#### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | False |
| BLUE | false |
| MGMT | false |
| RED | false |

### Static Routes

#### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP | Exit interface | Administrative Distance | Tag | Route Name | Metric |
| --- | ------------------ | ----------- | -------------- | ----------------------- | --- | ---------- | ------ |
| MGMT | 0.0.0.0/0 | 192.168.4.1 | - | 1 | - | - | - |

#### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 192.168.4.1
```

### Router BGP

ASN Notation: asplain

#### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65203 | 10.255.20.27 |

| BGP Tuning |
| ---------- |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| maximum-paths 4 ecmp 4 |

#### Router BGP Peer Groups

##### EVPN-OVERLAY-CORE

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 15 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 3 |
| Send community | all |
| Maximum routes | 0 (no limit) |

##### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Send community | all |
| Maximum routes | 12000 |

##### MLAG-IPv4-UNDERLAY-PEER

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Remote AS | 65203 |
| Next-hop self | True |
| Send community | all |
| Maximum routes | 12000 |

#### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain | Route-Reflector Client | Passive | TTL Max Hops |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- | ---------------------- | ------- | ------------ |
| 10.255.10.17 | 65103 | default | - | Inherited from peer group EVPN-OVERLAY-CORE | Inherited from peer group EVPN-OVERLAY-CORE | - | Inherited from peer group EVPN-OVERLAY-CORE | - | - | - | - |
| 10.255.10.18 | 65103 | default | - | Inherited from peer group EVPN-OVERLAY-CORE | Inherited from peer group EVPN-OVERLAY-CORE | - | Inherited from peer group EVPN-OVERLAY-CORE | - | - | - | - |
| 10.255.20.3 | 65200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 10.255.20.4 | 65200 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - | - | - | - |
| 10.255.252.49 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | default | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 172.16.30.5 | 65300 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - | - | - | - |
| 172.31.20.96 | 65200 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - | - | - | - |
| 172.31.20.98 | 65200 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - | - | - | - |
| 10.255.252.49 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | BLUE | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |
| 10.255.252.49 | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | RED | - | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | Inherited from peer group MLAG-IPv4-UNDERLAY-PEER | - | - | - | - | - | - |

#### Router BGP EVPN Address Family

##### EVPN Peer Groups

| Peer Group | Activate | Encapsulation |
| ---------- | -------- | ------------- |
| EVPN-OVERLAY-CORE | True | default |
| EVPN-OVERLAY-PEERS | True | default |

##### EVPN DCI Gateway Summary

| Settings | Value |
| -------- | ----- |
| Remote Domain Peer Groups | EVPN-OVERLAY-CORE |
| L3 Gateway Configured | True |
| L3 Gateway Inter-domain | True |

#### Router BGP VLANs

| VLAN | Route-Distinguisher | Both Route-Target | Import Route Target | Export Route-Target | Redistribute |
| ---- | ------------------- | ----------------- | ------------------- | ------------------- | ------------ |
| 111 | 10.255.20.27:10111 | 10111:10111<br>remote 10111:10111 | - | - | learned |
| 112 | 10.255.20.27:10112 | 10112:10112<br>remote 10112:10112 | - | - | learned |
| 120 | 10.255.20.27:55120 | 55120:55120<br>remote 55120:55120 | - | - | learned |
| 213 | 10.255.20.27:10213 | 10213:10213<br>remote 10213:10213 | - | - | learned |
| 214 | 10.255.20.27:10214 | 10214:10214<br>remote 10214:10214 | - | - | learned |

#### Router BGP VRFs

| VRF | Route-Distinguisher | Redistribute |
| --- | ------------------- | ------------ |
| BLUE | 10.255.20.27:220 | connected |
| RED | 10.255.20.27:110 | connected |

#### Router BGP Device Configuration

```eos
!
router bgp 65203
   router-id 10.255.20.27
   distance bgp 20 200 200
   maximum-paths 4 ecmp 4
   no bgp default ipv4-unicast
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
   neighbor MLAG-IPv4-UNDERLAY-PEER send-community
   neighbor MLAG-IPv4-UNDERLAY-PEER maximum-routes 12000
   neighbor MLAG-IPv4-UNDERLAY-PEER route-map RM-MLAG-PEER-IN in
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
   address-family rt-membership
      neighbor EVPN-OVERLAY-CORE activate
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-CORE activate
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
      neighbor MLAG-IPv4-UNDERLAY-PEER activate
   !
   vrf BLUE
      rd 10.255.20.27:220
      route-target import evpn 220:220
      route-target import evpn 110:110
      route-target export evpn 220:220
      route-target export evpn 110:110
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
```

## BFD

### Router BFD

#### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 300 | 300 | 3 |

#### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 300 min-rx 300 multiplier 3
```

## Multicast

### IP IGMP Snooping

#### IP IGMP Snooping Summary

| IGMP Snooping | Fast Leave | Interface Restart Query | Proxy | Restart Query Interval | Robustness Variable |
| ------------- | ---------- | ----------------------- | ----- | ---------------------- | ------------------- |
| Enabled | - | - | - | - | - |

#### IP IGMP Snooping Device Configuration

```eos
```

## Filters

### Prefix-lists

#### Prefix-lists Summary

##### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 10.255.20.0/24 eq 32 |
| 20 | permit 10.255.21.0/24 eq 32 |

#### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 10.255.20.0/24 eq 32
   seq 20 permit 10.255.21.0/24 eq 32
```

### Route-maps

#### Route-maps Summary

##### RM-CONN-2-BGP

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY | - | - | - |

##### RM-MLAG-PEER-IN

| Sequence | Type | Match | Set | Sub-Route-Map | Continue |
| -------- | ---- | ----- | --- | ------------- | -------- |
| 10 | permit | - | origin incomplete | - | - |

#### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
!
route-map RM-MLAG-PEER-IN permit 10
   description Make routes learned over MLAG Peer-link less preferred on spines to ensure optimal routing
   set origin incomplete
```

## VRF Instances

### VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| BLUE | enabled |
| MGMT | disabled |
| RED | enabled |

### VRF Instances Device Configuration

```eos
!
vrf instance BLUE
!
vrf instance MGMT
!
vrf instance RED
```

## Virtual Source NAT

### Virtual Source NAT Summary

| Source NAT VRF | Source NAT IP Address |
| -------------- | --------------------- |
| BLUE | 10.255.220.27 |
| RED | 10.255.110.27 |

### Virtual Source NAT Configuration

```eos
!
ip address virtual source-nat vrf BLUE address 10.255.220.27
ip address virtual source-nat vrf RED address 10.255.110.27
```
