\newpage
# Chapter 6: Virtual Machines and Virtualization

Virtual machines (VMs) are software emulations of physical computers. They allow you to run multiple operating systems on a single hardware device, providing a flexible and isolated environment for development, testing, and deployment. This chapter explains virtualization, the benefits and drawbacks of VMs, and provides a step-by-step tutorial on setting up a virtual machine using VirtualBox with the latest Ubuntu LTS version (24.04).

## What are Virtual Machines?

A virtual machine is a complete software-based computer that runs on top of a physical host machine. Unlike containers, VMs do not share the host kernel; each VM includes its own operating system kernel.

### Benefits of Virtual Machines
1. **Isolation**: Each VM operates independently, ensuring stable environments for different applications.
2. **Flexibility**: Run multiple operating systems simultaneously.
3. **Snapshot Functionality**: Save states and revert if needed.
4. **Security**: Isolated environments reduce the risk of system-wide vulnerabilities.

### Drawbacks of Virtual Machines
1. **Resource Intensive**: VMs require significant CPU, RAM, and storage.
2. **Slower Performance**: Overheads from virtualized hardware.
3. **Complexity**: Managing multiple VMs can be cumbersome.

## Installing VirtualBox

VirtualBox is a popular open-source virtualization software that allows you to create and manage VMs.

### Step 1: Download VirtualBox
1. Visit the [VirtualBox website](https://www.virtualbox.org/).
2. Download the installer for your operating system (Windows, macOS, or Linux).

### Step 2: Install VirtualBox
1. Run the downloaded installer.
2. Follow the on-screen instructions, accepting the default settings.
3. Launch VirtualBox after installation.

## Creating a Virtual Machine for Ubuntu 24.04

### Step 1: Download the Ubuntu 24.04 ISO
1. Visit the [Ubuntu downloads page](https://ubuntu.com/download/desktop).
2. Download the latest Ubuntu 24.04 LTS ISO file.

### Step 2: Create a New Virtual Machine
1. Open VirtualBox and click **New**.
2. Enter a name for your VM (e.g., "Ubuntu 24.04").
3. Select **Linux** as the type and **Ubuntu (64-bit)** as the version.
4. Click **Next**.

### Step 3: Allocate Resources
1. **Memory (RAM)**: Allocate at least 4 GB (4096 MB) for smooth performance.
2. **Hard Disk**:
   - Select **Create a virtual hard disk now**.
   - Choose **VDI (VirtualBox Disk Image)**.
   - Select **Dynamically allocated** for storage.
   - Allocate at least 25 GB of disk space.

### Step 4: Attach the Ubuntu ISO
1. Select your VM and click **Settings**.
2. Go to the **Storage** tab.
3. Under **Controller: IDE**, click the empty disk icon.
4. Click the disk icon on the right and select **Choose a disk file**.
5. Navigate to and select the downloaded Ubuntu ISO file.
6. Click **OK**.

### Step 5: Start the VM and Install Ubuntu
1. Select your VM and click **Start**.
2. Follow the on-screen instructions to install Ubuntu:
   - Select your language and click **Install Ubuntu**.
   - Choose **Normal installation**.
   - Follow the prompts to partition the virtual disk and set up your user account.
3. Reboot the VM after installation completes.

## Hands-On Exercise

### Verify Your Setup
1. Log into your Ubuntu VM.
2. Open a terminal and run the following commands:
   - **Update the package manager**:
     ```bash
     sudo apt update && sudo apt upgrade -y
     ```
   - **Verify kernel information**:
     ```bash
     uname -r
     ```

### Experiment with Snapshots
1. Stop the VM and take a snapshot in VirtualBox.
2. Make changes within the VM and revert to the snapshot.

## Benefits of Using Virtual Machines
- Ideal for testing new operating systems.
- Create isolated environments for specific projects.
- Develop and test applications in different OS setups.

## Summary

In this chapter, you learned:
- What virtual machines are and their advantages and disadvantages.
- How to install VirtualBox and create a virtual machine with Ubuntu 24.04.

VMs provide a versatile and secure environment for experimentation and development. In the next chapter, we’ll explore Docker and containerization, which offer lightweight alternatives to virtualization.

