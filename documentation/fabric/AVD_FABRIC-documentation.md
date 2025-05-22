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

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| DC1_BORDER_LEAF1 | Ethernet1 | 172.31.10.57/31 | DC1_SPINE1 | Ethernet5 | 172.31.10.56/31 |
| DC1_BORDER_LEAF1 | Ethernet2 | 172.31.10.59/31 | DC1_SPINE2 | Ethernet5 | 172.31.10.58/31 |
| DC1_BORDER_LEAF1 | Ethernet5 | 172.16.30.0/31 | WAN | Ethernet1 | 172.16.30.1/31 |
| DC1_BORDER_LEAF2 | Ethernet1 | 172.31.10.61/31 | DC1_SPINE1 | Ethernet6 | 172.31.10.60/31 |
| DC1_BORDER_LEAF2 | Ethernet2 | 172.31.10.63/31 | DC1_SPINE2 | Ethernet6 | 172.31.10.62/31 |
| DC1_BORDER_LEAF2 | Ethernet5 | 172.16.30.2/31 | WAN | Ethernet2 | 172.16.30.3/31 |
| DC1_LEAF1A | Ethernet1 | 172.31.10.41/31 | DC1_SPINE1 | Ethernet1 | 172.31.10.40/31 |
| DC1_LEAF1A | Ethernet2 | 172.31.10.43/31 | DC1_SPINE2 | Ethernet1 | 172.31.10.42/31 |
| DC1_LEAF1B | Ethernet1 | 172.31.10.45/31 | DC1_SPINE1 | Ethernet2 | 172.31.10.44/31 |
| DC1_LEAF1B | Ethernet2 | 172.31.10.47/31 | DC1_SPINE2 | Ethernet2 | 172.31.10.46/31 |
| DC1_LEAF2A | Ethernet1 | 172.31.10.49/31 | DC1_SPINE1 | Ethernet3 | 172.31.10.48/31 |
| DC1_LEAF2A | Ethernet2 | 172.31.10.51/31 | DC1_SPINE2 | Ethernet3 | 172.31.10.50/31 |
| DC1_LEAF2B | Ethernet1 | 172.31.10.53/31 | DC1_SPINE1 | Ethernet4 | 172.31.10.52/31 |
| DC1_LEAF2B | Ethernet2 | 172.31.10.55/31 | DC1_SPINE2 | Ethernet4 | 172.31.10.54/31 |
| DC2_BORDER_LEAF1 | Ethernet1 | 172.31.20.97/31 | DC2_SPINE1 | Ethernet5 | 172.31.20.96/31 |
| DC2_BORDER_LEAF1 | Ethernet2 | 172.31.20.99/31 | DC2_SPINE2 | Ethernet5 | 172.31.20.98/31 |
| DC2_BORDER_LEAF1 | Ethernet5 | 172.16.30.4/31 | WAN | Ethernet3 | 172.16.30.5/31 |
| DC2_BORDER_LEAF2 | Ethernet1 | 172.31.20.101/31 | DC2_SPINE1 | Ethernet6 | 172.31.20.100/31 |
| DC2_BORDER_LEAF2 | Ethernet2 | 172.31.20.103/31 | DC2_SPINE2 | Ethernet6 | 172.31.20.102/31 |
| DC2_BORDER_LEAF2 | Ethernet5 | 172.16.30.6/31 | WAN | Ethernet4 | 172.16.30.7/31 |
| DC2_LEAF1A | Ethernet1 | 172.31.20.81/31 | DC2_SPINE1 | Ethernet1 | 172.31.20.80/31 |
| DC2_LEAF1A | Ethernet2 | 172.31.20.83/31 | DC2_SPINE2 | Ethernet1 | 172.31.20.82/31 |
| DC2_LEAF1B | Ethernet1 | 172.31.20.85/31 | DC2_SPINE1 | Ethernet2 | 172.31.20.84/31 |
| DC2_LEAF1B | Ethernet2 | 172.31.20.87/31 | DC2_SPINE2 | Ethernet2 | 172.31.20.86/31 |
| DC2_LEAF2A | Ethernet1 | 172.31.20.89/31 | DC2_SPINE1 | Ethernet3 | 172.31.20.88/31 |
| DC2_LEAF2A | Ethernet2 | 172.31.20.91/31 | DC2_SPINE2 | Ethernet3 | 172.31.20.90/31 |
| DC2_LEAF2B | Ethernet1 | 172.31.20.93/31 | DC2_SPINE1 | Ethernet4 | 172.31.20.92/31 |
| DC2_LEAF2B | Ethernet2 | 172.31.20.95/31 | DC2_SPINE2 | Ethernet4 | 172.31.20.94/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 10.255.10.0/24 | 256 | 8 | 3.13 % |
| 10.255.20.0/24 | 256 | 8 | 3.13 % |
| 10.255.30.0/24 | 256 | 1 | 0.4 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 10.255.10.17/32 |
| DC1 | DC1_BORDER_LEAF2 | 10.255.10.18/32 |
| DC1 | DC1_LEAF1A | 10.255.10.13/32 |
| DC1 | DC1_LEAF1B | 10.255.10.14/32 |
| DC1 | DC1_LEAF2A | 10.255.10.15/32 |
| DC1 | DC1_LEAF2B | 10.255.10.16/32 |
| DC1 | DC1_SPINE1 | 10.255.10.1/32 |
| DC1 | DC1_SPINE2 | 10.255.10.2/32 |
| DC2 | DC2_BORDER_LEAF1 | 10.255.20.27/32 |
| DC2 | DC2_BORDER_LEAF2 | 10.255.20.28/32 |
| DC2 | DC2_LEAF1A | 10.255.20.23/32 |
| DC2 | DC2_LEAF1B | 10.255.20.24/32 |
| DC2 | DC2_LEAF2A | 10.255.20.25/32 |
| DC2 | DC2_LEAF2B | 10.255.20.26/32 |
| DC2 | DC2_SPINE1 | 10.255.20.3/32 |
| DC2 | DC2_SPINE2 | 10.255.20.4/32 |
| AVD_FABRIC | WAN | 10.255.30.31/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 10.255.11.0/24 | 256 | 6 | 2.35 % |
| 10.255.21.0/24 | 256 | 6 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC1 | DC1_BORDER_LEAF1 | 10.255.11.17/32 |
| DC1 | DC1_BORDER_LEAF2 | 10.255.11.17/32 |
| DC1 | DC1_LEAF1A | 10.255.11.13/32 |
| DC1 | DC1_LEAF1B | 10.255.11.13/32 |
| DC1 | DC1_LEAF2A | 10.255.11.15/32 |
| DC1 | DC1_LEAF2B | 10.255.11.15/32 |
| DC2 | DC2_BORDER_LEAF1 | 10.255.21.27/32 |
| DC2 | DC2_BORDER_LEAF2 | 10.255.21.27/32 |
| DC2 | DC2_LEAF1A | 10.255.21.23/32 |
| DC2 | DC2_LEAF1B | 10.255.21.23/32 |
| DC2 | DC2_LEAF2A | 10.255.21.25/32 |
| DC2 | DC2_LEAF2B | 10.255.21.25/32 |
