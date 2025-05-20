# AVD_FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| DC1 | l3leaf | DC1_BORDER_LEAF1 | 172.100.100.13/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_BORDER_LEAF2 | 172.100.100.14/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF1A | 172.100.100.101/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF1B | 172.100.100.102/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF2A | 172.100.100.103/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF2B | 172.100.100.104/24 | cEOS-LAB | Provisioned | - |
| DC1 | spine | DC1_SPINE1 | 172.100.100.11/24 | cEOS-LAB | Provisioned | - |
| DC1 | spine | DC1_SPINE2 | 172.100.100.12/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_BORDER_LEAF1 | 172.100.100.23/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_BORDER_LEAF2 | 172.100.100.24/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF1A | 172.100.100.121/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF1B | 172.100.100.122/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF2A | 172.100.100.123/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF2B | 172.100.100.124/24 | cEOS-LAB | Provisioned | - |
| DC2 | spine | DC2_SPINE1 | 172.100.100.21/24 | cEOS-LAB | Provisioned | - |
| DC2 | spine | DC2_SPINE2 | 172.100.100.22/24 | cEOS-LAB | Provisioned | - |
| AVD_FABRIC | super-spine | WAN | 172.100.100.30/24 | cEOS-LAB | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | DC1_BORDER_LEAF1 | Ethernet1 | spine | DC1_SPINE1 | Ethernet5 |
| l3leaf | DC1_BORDER_LEAF1 | Ethernet2 | spine | DC1_SPINE2 | Ethernet5 |
| l3leaf | DC1_BORDER_LEAF1 | Ethernet3 | mlag_peer | DC1_BORDER_LEAF2 | Ethernet3 |
| l3leaf | DC1_BORDER_LEAF1 | Ethernet4 | mlag_peer | DC1_BORDER_LEAF2 | Ethernet4 |
| l3leaf | DC1_BORDER_LEAF1 | Ethernet5 | super-spine | WAN | Ethernet1 |
| l3leaf | DC1_BORDER_LEAF2 | Ethernet1 | spine | DC1_SPINE1 | Ethernet6 |
| l3leaf | DC1_BORDER_LEAF2 | Ethernet2 | spine | DC1_SPINE2 | Ethernet6 |
| l3leaf | DC1_BORDER_LEAF2 | Ethernet5 | super-spine | WAN | Ethernet2 |
| l3leaf | DC1_LEAF1A | Ethernet1 | spine | DC1_SPINE1 | Ethernet1 |
| l3leaf | DC1_LEAF1A | Ethernet2 | spine | DC1_SPINE2 | Ethernet1 |
| l3leaf | DC1_LEAF1A | Ethernet3 | mlag_peer | DC1_LEAF1B | Ethernet3 |
| l3leaf | DC1_LEAF1A | Ethernet4 | mlag_peer | DC1_LEAF1B | Ethernet4 |
| l3leaf | DC1_LEAF1B | Ethernet1 | spine | DC1_SPINE1 | Ethernet2 |
| l3leaf | DC1_LEAF1B | Ethernet2 | spine | DC1_SPINE2 | Ethernet2 |
| l3leaf | DC1_LEAF2A | Ethernet1 | spine | DC1_SPINE1 | Ethernet3 |
| l3leaf | DC1_LEAF2A | Ethernet2 | spine | DC1_SPINE2 | Ethernet3 |
| l3leaf | DC1_LEAF2A | Ethernet3 | mlag_peer | DC1_LEAF2B | Ethernet3 |
| l3leaf | DC1_LEAF2A | Ethernet4 | mlag_peer | DC1_LEAF2B | Ethernet4 |
| l3leaf | DC1_LEAF2B | Ethernet1 | spine | DC1_SPINE1 | Ethernet4 |
| l3leaf | DC1_LEAF2B | Ethernet2 | spine | DC1_SPINE2 | Ethernet4 |
| l3leaf | DC2_BORDER_LEAF1 | Ethernet1 | spine | DC2_SPINE1 | Ethernet5 |
| l3leaf | DC2_BORDER_LEAF1 | Ethernet2 | spine | DC2_SPINE2 | Ethernet5 |
| l3leaf | DC2_BORDER_LEAF1 | Ethernet3 | mlag_peer | DC2_BORDER_LEAF2 | Ethernet3 |
| l3leaf | DC2_BORDER_LEAF1 | Ethernet4 | mlag_peer | DC2_BORDER_LEAF2 | Ethernet4 |
| l3leaf | DC2_BORDER_LEAF1 | Ethernet5 | super-spine | WAN | Ethernet3 |
| l3leaf | DC2_BORDER_LEAF2 | Ethernet1 | spine | DC2_SPINE1 | Ethernet6 |
| l3leaf | DC2_BORDER_LEAF2 | Ethernet2 | spine | DC2_SPINE2 | Ethernet6 |
| l3leaf | DC2_BORDER_LEAF2 | Ethernet5 | super-spine | WAN | Ethernet4 |
| l3leaf | DC2_LEAF1A | Ethernet1 | spine | DC2_SPINE1 | Ethernet1 |
| l3leaf | DC2_LEAF1A | Ethernet2 | spine | DC2_SPINE2 | Ethernet1 |
| l3leaf | DC2_LEAF1A | Ethernet3 | mlag_peer | DC2_LEAF1B | Ethernet3 |
| l3leaf | DC2_LEAF1A | Ethernet4 | mlag_peer | DC2_LEAF1B | Ethernet4 |
| l3leaf | DC2_LEAF1B | Ethernet1 | spine | DC2_SPINE1 | Ethernet2 |
| l3leaf | DC2_LEAF1B | Ethernet2 | spine | DC2_SPINE2 | Ethernet2 |
| l3leaf | DC2_LEAF2A | Ethernet1 | spine | DC2_SPINE1 | Ethernet3 |
| l3leaf | DC2_LEAF2A | Ethernet2 | spine | DC2_SPINE2 | Ethernet3 |
| l3leaf | DC2_LEAF2A | Ethernet3 | mlag_peer | DC2_LEAF2B | Ethernet3 |
| l3leaf | DC2_LEAF2A | Ethernet4 | mlag_peer | DC2_LEAF2B | Ethernet4 |
| l3leaf | DC2_LEAF2B | Ethernet1 | spine | DC2_SPINE1 | Ethernet4 |
| l3leaf | DC2_LEAF2B | Ethernet2 | spine | DC2_SPINE2 | Ethernet4 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.31.100.0/24 | 256 | 24 | 9.38 % |
| 172.31.200.0/24 | 256 | 24 | 9.38 % |
| 172.31.250.0/24 | 256 | 8 | 3.13 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC1_BORDER_LEAF1 | Ethernet1 | 172.31.100.17/31 | DC1_SPINE1 | Ethernet5 | 172.31.100.16/31 |
| DC1_BORDER_LEAF1 | Ethernet2 | 172.31.100.19/31 | DC1_SPINE2 | Ethernet5 | 172.31.100.18/31 |
| DC1_BORDER_LEAF1 | Ethernet5 | 172.31.250.0/31 | WAN | Ethernet1 | 172.31.250.1/31 |
| DC1_BORDER_LEAF2 | Ethernet1 | 172.31.100.21/31 | DC1_SPINE1 | Ethernet6 | 172.31.100.20/31 |
| DC1_BORDER_LEAF2 | Ethernet2 | 172.31.100.23/31 | DC1_SPINE2 | Ethernet6 | 172.31.100.22/31 |
| DC1_BORDER_LEAF2 | Ethernet5 | 172.31.250.2/31 | WAN | Ethernet2 | 172.31.250.3/31 |
| DC1_LEAF1A | Ethernet1 | 172.31.100.1/31 | DC1_SPINE1 | Ethernet1 | 172.31.100.0/31 |
| DC1_LEAF1A | Ethernet2 | 172.31.100.3/31 | DC1_SPINE2 | Ethernet1 | 172.31.100.2/31 |
| DC1_LEAF1B | Ethernet1 | 172.31.100.5/31 | DC1_SPINE1 | Ethernet2 | 172.31.100.4/31 |
| DC1_LEAF1B | Ethernet2 | 172.31.100.7/31 | DC1_SPINE2 | Ethernet2 | 172.31.100.6/31 |
| DC1_LEAF2A | Ethernet1 | 172.31.100.9/31 | DC1_SPINE1 | Ethernet3 | 172.31.100.8/31 |
| DC1_LEAF2A | Ethernet2 | 172.31.100.11/31 | DC1_SPINE2 | Ethernet3 | 172.31.100.10/31 |
| DC1_LEAF2B | Ethernet1 | 172.31.100.13/31 | DC1_SPINE1 | Ethernet4 | 172.31.100.12/31 |
| DC1_LEAF2B | Ethernet2 | 172.31.100.15/31 | DC1_SPINE2 | Ethernet4 | 172.31.100.14/31 |
| DC2_BORDER_LEAF1 | Ethernet1 | 172.31.200.17/31 | DC2_SPINE1 | Ethernet5 | 172.31.200.16/31 |
| DC2_BORDER_LEAF1 | Ethernet2 | 172.31.200.19/31 | DC2_SPINE2 | Ethernet5 | 172.31.200.18/31 |
| DC2_BORDER_LEAF1 | Ethernet5 | 172.31.250.4/31 | WAN | Ethernet3 | 172.31.250.5/31 |
| DC2_BORDER_LEAF2 | Ethernet1 | 172.31.200.21/31 | DC2_SPINE1 | Ethernet6 | 172.31.200.20/31 |
| DC2_BORDER_LEAF2 | Ethernet2 | 172.31.200.23/31 | DC2_SPINE2 | Ethernet6 | 172.31.200.22/31 |
| DC2_BORDER_LEAF2 | Ethernet5 | 172.31.250.6/31 | WAN | Ethernet4 | 172.31.250.7/31 |
| DC2_LEAF1A | Ethernet1 | 172.31.200.1/31 | DC2_SPINE1 | Ethernet1 | 172.31.200.0/31 |
| DC2_LEAF1A | Ethernet2 | 172.31.200.3/31 | DC2_SPINE2 | Ethernet1 | 172.31.200.2/31 |
| DC2_LEAF1B | Ethernet1 | 172.31.200.5/31 | DC2_SPINE1 | Ethernet2 | 172.31.200.4/31 |
| DC2_LEAF1B | Ethernet2 | 172.31.200.7/31 | DC2_SPINE2 | Ethernet2 | 172.31.200.6/31 |
| DC2_LEAF2A | Ethernet1 | 172.31.200.9/31 | DC2_SPINE1 | Ethernet3 | 172.31.200.8/31 |
| DC2_LEAF2A | Ethernet2 | 172.31.200.11/31 | DC2_SPINE2 | Ethernet3 | 172.31.200.10/31 |
| DC2_LEAF2B | Ethernet1 | 172.31.200.13/31 | DC2_SPINE1 | Ethernet4 | 172.31.200.12/31 |
| DC2_LEAF2B | Ethernet2 | 172.31.200.15/31 | DC2_SPINE2 | Ethernet4 | 172.31.200.14/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.100.0/24 | 256 | 8 | 3.13 % |
| 192.168.200.0/24 | 256 | 8 | 3.13 % |
| 192.168.250.0/24 | 256 | 1 | 0.4 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 192.168.100.7/32 |
| DC1 | DC1_BORDER_LEAF2 | 192.168.100.8/32 |
| DC1 | DC1_LEAF1A | 192.168.100.3/32 |
| DC1 | DC1_LEAF1B | 192.168.100.4/32 |
| DC1 | DC1_LEAF2A | 192.168.100.5/32 |
| DC1 | DC1_LEAF2B | 192.168.100.6/32 |
| DC1 | DC1_SPINE1 | 192.168.100.1/32 |
| DC1 | DC1_SPINE2 | 192.168.100.2/32 |
| DC2 | DC2_BORDER_LEAF1 | 192.168.200.7/32 |
| DC2 | DC2_BORDER_LEAF2 | 192.168.200.8/32 |
| DC2 | DC2_LEAF1A | 192.168.200.3/32 |
| DC2 | DC2_LEAF1B | 192.168.200.4/32 |
| DC2 | DC2_LEAF2A | 192.168.200.5/32 |
| DC2 | DC2_LEAF2B | 192.168.200.6/32 |
| DC2 | DC2_SPINE1 | 192.168.200.1/32 |
| DC2 | DC2_SPINE2 | 192.168.200.2/32 |
| AVD_FABRIC | WAN | 192.168.250.1/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.101.0/24 | 256 | 6 | 2.35 % |
| 192.168.202.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 192.168.101.7/32 |
| DC1 | DC1_BORDER_LEAF2 | 192.168.101.7/32 |
| DC1 | DC1_LEAF1A | 192.168.101.3/32 |
| DC1 | DC1_LEAF1B | 192.168.101.3/32 |
| DC1 | DC1_LEAF2A | 192.168.101.5/32 |
| DC1 | DC1_LEAF2B | 192.168.101.5/32 |
| DC2 | DC2_BORDER_LEAF1 | 192.168.202.7/32 |
| DC2 | DC2_BORDER_LEAF2 | 192.168.202.7/32 |
| DC2 | DC2_LEAF1A | 192.168.202.3/32 |
| DC2 | DC2_LEAF1B | 192.168.202.3/32 |
| DC2 | DC2_LEAF2A | 192.168.202.5/32 |
| DC2 | DC2_LEAF2B | 192.168.202.5/32 |
