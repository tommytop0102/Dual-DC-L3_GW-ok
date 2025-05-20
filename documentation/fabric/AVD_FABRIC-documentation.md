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
| DC1 | l3leaf | DC1_BORDER_LEAF1 | 192.168.4.17/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_BORDER_LEAF2 | 192.168.4.18/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF1A | 192.168.4.13/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF1B | 192.168.4.14/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF2A | 192.168.4.15/24 | cEOS-LAB | Provisioned | - |
| DC1 | l3leaf | DC1_LEAF2B | 192.168.4.16/24 | cEOS-LAB | Provisioned | - |
| DC1 | spine | DC1_SPINE1 | 192.168.4.11/24 | cEOS-LAB | Provisioned | - |
| DC1 | spine | DC1_SPINE2 | 192.168.4.12/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_BORDER_LEAF1 | 192.168.4.27/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_BORDER_LEAF2 | 192.168.4.28/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF1A | 192.168.4.23/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF1B | 192.168.4.24/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF2A | 192.168.4.25/24 | cEOS-LAB | Provisioned | - |
| DC2 | l3leaf | DC2_LEAF2B | 192.168.4.26/24 | cEOS-LAB | Provisioned | - |
| DC2 | spine | DC2_SPINE1 | 192.168.4.21/24 | cEOS-LAB | Provisioned | - |
| DC2 | spine | DC2_SPINE2 | 192.168.4.22/24 | cEOS-LAB | Provisioned | - |
| AVD_FABRIC | super-spine | WAN | 192.168.4.30/24 | cEOS-LAB | Provisioned | - |

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
| 172.31.10.0/24 | 256 | 24 | 9.38 % |
| 172.31.20.0/24 | 256 | 24 | 9.38 % |
| 172.31.30.0/24 | 256 | 8 | 3.13 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC1_BORDER_LEAF1 | Ethernet1 | 172.31.10.17/31 | DC1_SPINE1 | Ethernet5 | 172.31.10.16/31 |
| DC1_BORDER_LEAF1 | Ethernet2 | 172.31.10.19/31 | DC1_SPINE2 | Ethernet5 | 172.31.10.18/31 |
| DC1_BORDER_LEAF1 | Ethernet5 | 172.31.30.0/31 | WAN | Ethernet1 | 172.31.30.1/31 |
| DC1_BORDER_LEAF2 | Ethernet1 | 172.31.10.21/31 | DC1_SPINE1 | Ethernet6 | 172.31.10.20/31 |
| DC1_BORDER_LEAF2 | Ethernet2 | 172.31.10.23/31 | DC1_SPINE2 | Ethernet6 | 172.31.10.22/31 |
| DC1_BORDER_LEAF2 | Ethernet5 | 172.31.30.2/31 | WAN | Ethernet2 | 172.31.30.3/31 |
| DC1_LEAF1A | Ethernet1 | 172.31.10.1/31 | DC1_SPINE1 | Ethernet1 | 172.31.10.0/31 |
| DC1_LEAF1A | Ethernet2 | 172.31.10.3/31 | DC1_SPINE2 | Ethernet1 | 172.31.10.2/31 |
| DC1_LEAF1B | Ethernet1 | 172.31.10.5/31 | DC1_SPINE1 | Ethernet2 | 172.31.10.4/31 |
| DC1_LEAF1B | Ethernet2 | 172.31.10.7/31 | DC1_SPINE2 | Ethernet2 | 172.31.10.6/31 |
| DC1_LEAF2A | Ethernet1 | 172.31.10.9/31 | DC1_SPINE1 | Ethernet3 | 172.31.10.8/31 |
| DC1_LEAF2A | Ethernet2 | 172.31.10.11/31 | DC1_SPINE2 | Ethernet3 | 172.31.10.10/31 |
| DC1_LEAF2B | Ethernet1 | 172.31.10.13/31 | DC1_SPINE1 | Ethernet4 | 172.31.10.12/31 |
| DC1_LEAF2B | Ethernet2 | 172.31.10.15/31 | DC1_SPINE2 | Ethernet4 | 172.31.10.14/31 |
| DC2_BORDER_LEAF1 | Ethernet1 | 172.31.20.17/31 | DC2_SPINE1 | Ethernet5 | 172.31.20.16/31 |
| DC2_BORDER_LEAF1 | Ethernet2 | 172.31.20.19/31 | DC2_SPINE2 | Ethernet5 | 172.31.20.18/31 |
| DC2_BORDER_LEAF1 | Ethernet5 | 172.31.30.4/31 | WAN | Ethernet3 | 172.31.30.5/31 |
| DC2_BORDER_LEAF2 | Ethernet1 | 172.31.20.21/31 | DC2_SPINE1 | Ethernet6 | 172.31.20.20/31 |
| DC2_BORDER_LEAF2 | Ethernet2 | 172.31.20.23/31 | DC2_SPINE2 | Ethernet6 | 172.31.20.22/31 |
| DC2_BORDER_LEAF2 | Ethernet5 | 172.31.30.6/31 | WAN | Ethernet4 | 172.31.30.7/31 |
| DC2_LEAF1A | Ethernet1 | 172.31.20.1/31 | DC2_SPINE1 | Ethernet1 | 172.31.20.0/31 |
| DC2_LEAF1A | Ethernet2 | 172.31.20.3/31 | DC2_SPINE2 | Ethernet1 | 172.31.20.2/31 |
| DC2_LEAF1B | Ethernet1 | 172.31.20.5/31 | DC2_SPINE1 | Ethernet2 | 172.31.20.4/31 |
| DC2_LEAF1B | Ethernet2 | 172.31.20.7/31 | DC2_SPINE2 | Ethernet2 | 172.31.20.6/31 |
| DC2_LEAF2A | Ethernet1 | 172.31.20.9/31 | DC2_SPINE1 | Ethernet3 | 172.31.20.8/31 |
| DC2_LEAF2A | Ethernet2 | 172.31.20.11/31 | DC2_SPINE2 | Ethernet3 | 172.31.20.10/31 |
| DC2_LEAF2B | Ethernet1 | 172.31.20.13/31 | DC2_SPINE1 | Ethernet4 | 172.31.20.12/31 |
| DC2_LEAF2B | Ethernet2 | 172.31.20.15/31 | DC2_SPINE2 | Ethernet4 | 172.31.20.14/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.255.10.0/24 | 256 | 8 | 3.13 % |
| 10.255.20.0/24 | 256 | 8 | 3.13 % |
| 10.255.30.0/24 | 256 | 1 | 0.4 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 10.255.10.7/32 |
| DC1 | DC1_BORDER_LEAF2 | 10.255.10.8/32 |
| DC1 | DC1_LEAF1A | 10.255.10.3/32 |
| DC1 | DC1_LEAF1B | 10.255.10.4/32 |
| DC1 | DC1_LEAF2A | 10.255.10.5/32 |
| DC1 | DC1_LEAF2B | 10.255.10.6/32 |
| DC1 | DC1_SPINE1 | 10.255.10.1/32 |
| DC1 | DC1_SPINE2 | 10.255.10.2/32 |
| DC2 | DC2_BORDER_LEAF1 | 10.255.20.7/32 |
| DC2 | DC2_BORDER_LEAF2 | 10.255.20.8/32 |
| DC2 | DC2_LEAF1A | 10.255.20.3/32 |
| DC2 | DC2_LEAF1B | 10.255.20.4/32 |
| DC2 | DC2_LEAF2A | 10.255.20.5/32 |
| DC2 | DC2_LEAF2B | 10.255.20.6/32 |
| DC2 | DC2_SPINE1 | 10.255.20.1/32 |
| DC2 | DC2_SPINE2 | 10.255.20.2/32 |
| AVD_FABRIC | WAN | 10.255.30.1/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.255.11.0/24 | 256 | 6 | 2.35 % |
| 10.255.21.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 10.255.11.7/32 |
| DC1 | DC1_BORDER_LEAF2 | 10.255.11.7/32 |
| DC1 | DC1_LEAF1A | 10.255.11.3/32 |
| DC1 | DC1_LEAF1B | 10.255.11.3/32 |
| DC1 | DC1_LEAF2A | 10.255.11.5/32 |
| DC1 | DC1_LEAF2B | 10.255.11.5/32 |
| DC2 | DC2_BORDER_LEAF1 | 10.255.21.7/32 |
| DC2 | DC2_BORDER_LEAF2 | 10.255.21.7/32 |
| DC2 | DC2_LEAF1A | 10.255.21.3/32 |
| DC2 | DC2_LEAF1B | 10.255.21.3/32 |
| DC2 | DC2_LEAF2A | 10.255.21.5/32 |
| DC2 | DC2_LEAF2B | 10.255.21.5/32 |
