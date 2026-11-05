# Azure Virtual Machines (VMs)

## 1. What are Virtual Machines (VMs)?

A **Virtual Machine (VM)** is a software-based computer that runs on a physical computer. It behaves like a real computer and has its own operating system, CPU, memory, storage, and network.

### Key Points
- Multiple operating systems can run on a single physical machine.
- Each VM is isolated from other VMs.
- VMs are useful for development, testing, application hosting, and running servers.
- VM resources can be increased or decreased based on workload requirements.

**Example:** Running Windows and Linux on the same physical computer using virtual machines.

---

## 2. Components of an Azure Virtual Machine

An **Azure Virtual Machine** is a computing service provided by Microsoft Azure. Its main components are:

| Component | Description |
|---|---|
| Virtual CPU (vCPU) | Provides processing power to execute applications and tasks. |
| Memory (RAM) | Holds temporary data used by running applications. |
| Operating System (OS) | Windows or Linux installed on the VM. |
| OS Disk | Stores the operating system and boot files. |
| Data Disk | Provides additional storage for application data and files. |
| Network Interface (NIC) | Connects the VM to a virtual network. |
| Virtual Network (VNet) | Enables communication between Azure resources. |
| Public IP Address | Allows the VM to be accessed from the internet when configured. |
| Network Security Group (NSG) | Controls inbound and outbound traffic using security rules. |
| Azure Virtualization Infrastructure | The underlying Azure platform that runs and manages virtual machines. |

**In short:** Azure VM = CPU + RAM + OS + Disks + Networking + Security.

---

## 3. Architecture of an Azure Virtual Machine

Azure VM architecture combines computing, storage, networking, security, and management services to run applications in the cloud.

### Main Components

1. **Azure Region:** A geographical area containing Azure datacenters where resources are hosted.
2. **Availability Set / Availability Zone:** Helps improve availability and protect VMs from infrastructure failures.
3. **Virtual Network (VNet):** Provides private networking for Azure resources.
4. **Subnet:** Divides a virtual network into smaller network segments.
5. **Network Interface (NIC):** Connects a VM to a subnet.
6. **Network Security Group (NSG):** Filters network traffic using security rules.
7. **Virtual Machine:** Provides computing resources such as CPU, RAM, and an operating system.
8. **OS Disk:** Stores the VM's operating system.
9. **Data Disk:** Stores application data and files.
10. **Azure Load Balancer:** Distributes incoming network traffic across multiple VMs.
11. **Azure Storage:** Provides the underlying storage for managed disks and other data.
12. **Azure Resource Manager (ARM):** Deploys, organizes, and manages Azure resources.

### How the Architecture Works

1. A VM is deployed in an Azure region.
2. The VM uses CPU, RAM, and an operating system to run applications.
3. A NIC connects the VM to a VNet and subnet.
4. NSG rules control permitted network traffic.
5. OS and data disks store the operating system and application data.
6. A load balancer can distribute traffic across multiple VMs for better availability and scalability.
7. Azure Resource Manager manages the deployment and configuration of resources.

### Simplified Architecture

```text
                 Users / Internet
                        |
                Public IP Address
                        |
                 Azure Load Balancer
                        |
          +-------------+-------------+
          |                           |
     Virtual Machine 1           Virtual Machine 2
     +-------------+             +-------------+
     | vCPU / RAM  |             | vCPU / RAM  |
     | Operating   |             | Operating   |
     | System      |             | System      |
     | OS Disk     |             | OS Disk     |
     | Data Disk   |             | Data Disk   |
     +------+------+             +------+------+
            |                           |
            +-------------+-------------+
                          |
                  Network Interfaces
                          |
                Network Security Group
                          |
                  Virtual Network
                          |
                     Subnet
                          |
                 Azure Region

          Azure Resource Manager (ARM)
             manages Azure resources
```

**In short:** Azure VM architecture provides computing, storage, networking, security, availability, and resource management to run applications in the cloud.
