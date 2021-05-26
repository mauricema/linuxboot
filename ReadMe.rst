LinuxBoot with Slim Bootloader
==============================

Overview
~~~~~~~~
`LinuxBoot <https://www.linuxboot.org/>`_ is a firmware for modern servers that replaces specific
firmware functionality with a Linux kernel and runtime. It can work with many different bootloaders
such as coreboot, u-boot, UEFI and Slim Bootloader.  This repo demonstrates how to enable LinuxBoot
on Slim Bootloader with QEMU platform. The similar steps can be applied on ohter real
`hardware platforms <https://slimbootloader.github.io/supported-hardware/index.html>`_ supported by Slim Bootloader.

Build
~~~~~
- Prepare basic environment for u-root.
  Please refer to `u-root <https://u-root.org/>`_ for GO language development environment setup.

- Prepare basic environment for Slim Bootloader.
  Please refer to `Slim Bootloader <https://slimbootloader.github.io/getting-started/build-host-setup.html>`_ for details.

- Clone this repo and then run build command::

   make all

- Run LinuxBoot on QEMU::

   make run



Boot Log
~~~~~~~~
LinuxBoot log on QEMU::

  qemu-system-x86_64 -cpu qemu64,+movbe -machine q35,max-fw-size=16777216 -m 256 -serial mon:stdio -bn
  WARNING: Image format was not specified for 'sbl/Outputs/qemu/SlimBootloader.bin' and probing guess.
           Automatically detecting the format is dangerous for raw images, write operations on block .
           Specify the 'raw' format explicitly to remove the restrictions.

  ============= Intel Slim Bootloader STAGE1A =============
  SBID: SB_QEMU
  ISVN: 001
  IVER: 000.005.001.001.00545
  SVER: F7ADD2E46D5F9B4E
  FDBG: BLD(D IA32) FSP(R)
  FSPV: ID($QEMFSP$) REV(00001000)
  Loader global data @ 0x00001D44
  Run  STAGE1A @ 0x00070000
  Load STAGE1B @ 0x00040000
  HASH verification for usage (0x00000001) with Hash Alg (0x2): Success

  ============= Intel Slim Bootloader STAGE1B =============
  Host Bridge Device ID:0x29C0
  Board ID:0x1 - Loading QEMU!
  QEMU Flash: Attempting flash detection at FF000000
  QemuFlashDetected => FD behaves as FLASH
  QemuFlashDetected => Yes
  SpiInstance = 0000E480
  Variable region: 0xFF7A0000:0x2000
    SPI WRITE: FF7A0010  00000004
    SPI WRITE: FF7A0011  00000001
    SPI WRITE: FF7A0014  00000008
    SPI WRITE: FF7A001C  00000004
    SPI WRITE: FF7A0011  00000001
  Loading Component KEYH:_HS_
  Registering container KEYH
  HASH verification for usage (0x00000100) with Hash Alg (0x2): Success
  SignType (0x2) SignSize (0x180)  SignHashAlg (0x2)
  RSA verification for usage (0x00000100): Success
  HASH verification for usage (0x00000000) with Hash Alg (0x2): Success
  Append public key hash into store: Success
  Load EXT CFG Data @ 0x0000EB54:0x0170 ... Success
  HASH verification for usage (0x00000200) with Hash Alg (0x2): Success
  SignType (0x2) SignSize (0x180)  SignHashAlg (0x2)
  RSA verification for usage (0x00000200): Success
  BOOT: BP0
  MODE: 0
  BoardID: 0x01
  PlatformName: QEMU_01
  Memory Init
  Found Config TAG: 0x180 @ 0x0000ECE4
    MemCfg.Test1=11223344, MemCfg.Test2=11223346
  Found Config TAG: 0x200 @ 0x0000ECF4
    SilCfg.Test1=11223347, SilCfg.Test2=04030201
  Call FspMemoryInit ... Success
  Loader global data @ 0x0EEBFD70
  Load page table from memory @ 0x0DF74000
  Remapping Stage to 0x0DF77000
      FSP Resource HOB Range        Type       Owner
  ================================= ==== ====================================
  0000000000000000-00000000000A0000  00  00000000-0000-0000-0000-000000000000
  00000000000A0000-0000000000100000  05  00000000-0000-0000-0000-000000000000
  0000000000100000-000000000EF00000  00  00000000-0000-0000-0000-000000000000
  000000000EF00000-000000000F000000  05  69A79759-1373-4367-A6C4-C7F59EFD986E
  000000000F000000-0000000010000000  05  D038747C-D00C-4980-B319-490199A47D55

  Switch to memory stack @ 0x0EEFFF00
  Stage1 stack: 0x2000 (0x1210 used)
  Stage1 heap: 0xE000 (0x1F04 used)
  Call FspTempRamExit ... Success
  Memory FSP @ 0x0EF00000
  Memory TOP @ 0x0DF74000
  Loading Component FLMP:SG02
  HASH verification for usage (0x00000002) with Hash Alg (0x2): Success
  Loaded STAGE2 @ 0x0EE55000

  ============= Intel Slim Bootloader STAGE2 =============
  Unmapping Stage
  Board GPIO Init
  Get base platform GPIO table from board ID 0
  Programming 7 GPIO entries
  GPIO GPP_A00 DATA: 0x00000000 0x00000010
  GPIO GPP_A02 DATA: 0x80000002 0x00000012
  GPIO GPP_A03 DATA: 0xC0000003 0x00000013
  GPIO GPP_A04 DATA: 0x01000004 0x00000014
  GPIO GPP_A05 DATA: 0x41000005 0x00000015
  GPIO GPP_A06 DATA: 0x81000006 0x00000016
  GPIO GPP_A07 DATA: 0xC1000007 0x00000017
  Test variable services
    SPI WRITE: FF7A0020  00000004
    SPI WRITE: FF7A0021  00000001
    SPI WRITE: FF7A0024  00000008
    SPI WRITE: FF7A002C  00000004
    SPI WRITE: FF7A0011  00000001
    SPI WRITE: FF7A0021  00000001
    SPI WRITE: FF7A0011  00000001
  Loading Component IPFW:TST3
  Registering container IPFW
  HASH verification for usage (0x00001000) with Hash Alg (0x2): Success
  SignType (0x2) SignSize (0x180)  SignHashAlg (0x2)
  RSA verification for usage (0x00001000): Success
  HASH verification for usage (0x00000000) with Hash Alg (0x2): Success
  SignType (0x2) SignSize (0x180)  SignHashAlg (0x2)
  RSA verification for usage (0x00000000): Success
  Load IP firmware @ 0:0x0 - Bad Buffer Size
  Silicon Init
  Select VBT ImageId 0x00000001
  Call FspSiliconInit ...
  Success
  Graphics Info: 800 x 600 x 32 @ 0x80000000
  MEM: 0000000000000000 00000000000A0000 00 1
  MEM: 00000000000A0000 0000000000060000 00 2
  MEM: 0000000000100000 000000000DE00000 00 1
  MEM: 000000000DF00000 0000000000004000 01 2
  MEM: 000000000DF04000 0000000000068000 00 3
  MEM: 000000000DF6C000 0000000000008000 00 4
  MEM: 000000000DF74000 0000000000F8C000 00 2
  MEM: 000000000EF00000 0000000000100000 00 2
  MEM: 000000000F000000 0000000001000000 00 2
  MEM: 00000000FF000000 0000000001000000 00 2
  MP Init (Wakeup)
  MP Init (Run)
  Detected 1 CPU threads
   CPU  0 APIC ID: 0
  SMM rebase done on 1 CPUs
  PCI Enum
  Call FspNotifyPhase(20) ... Success
  ACPI Init
  Publish ACPI table: FACP
  Publish ACPI table: HPET
  Publish ACPI table: APIC
  Publish ACPI table: MCFG
  Publish ACPI table: FPDT
  Publish ACPI table: BGRT
  Publish ACPI table: TEST
  ACPI Ret: Success
  Enable SMRR
  Loading Payload ID LINX
  Loading Component EPLD:LINX
  Registering container EPLD
  HASH verification for usage (0x00001000) with Hash Alg (0x2): Success
  SignType (0x2) SignSize (0x180)  SignHashAlg (0x2)
  RSA verification for usage (0x00001000): Success
  HASH verification for usage (0x00000000) with Hash Alg (0x2): Success
  Load Payload ID 0x584E494C @ 0x00800000
  Found bzimage Signature
  BzImage Format Payload
  Loading Component EPLD:CMDL
  HASH verification for usage (0x00000000) with Hash Alg (0x2): Success
  Kernel command line:
  console=ttyS0,115200n8
  Loading Component EPLD:INRD
  HASH verification for usage (0x00000000) with Hash Alg (0x2): Success
  InitRD is loaded at 0xE9F7000:0x2FAEBC
  Found bzimage Signature
  MP Init (Done)
  Call FspNotifyPhase(40) ... Success
  Call FspNotifyPhase(F0) ... Success
  HOB @ 0x0EEC0000
  Created 4 OS boot options (Current: 16)
  Stage2 stack: 0x40000 (stack used 0xB10, HOB used 0xFA0, 0x3E550 free)
  Stage2 heap: 0xF4C000 (0x4C9000 used, 0xA83000 free)
  Payload entry: 0x0EE59064
  Jump to payload

  Switch to LongMode and jump to 64-bit kernel entrypoint ...
  Linux version 5.11.0 (mxma@mxma-ubuntu) (gcc (Ubuntu 9.3.0-23ubuntu1~16.04) 9.3.0, GNU ld (GNU Binu1
  Command line: console=ttyS0,115200n8  acpi_rsdp=0xDF04000
  x86/fpu: x87 FPU will use FXSAVE
  BIOS-provided physical RAM map:
  BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
  BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
  BIOS-e820: [mem 0x0000000000100000-0x000000000defffff] usable
  BIOS-e820: [mem 0x000000000df00000-0x000000000df03fff] reserved
  BIOS-e820: [mem 0x000000000df04000-0x000000000df6bfff] ACPI data
  BIOS-e820: [mem 0x000000000df6c000-0x000000000df73fff] ACPI NVS
  BIOS-e820: [mem 0x000000000df74000-0x000000000fffffff] reserved
  BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
  NX (Execute Disable) protection: active
  SMBIOS 2.5 present.
  DMI: Intel Corporation Unknown/Unknown, BIOS XXXX.XXX.XXX.XXX Unknown
  tsc: Fast TSC calibration using PIT
  tsc: Detected 3292.542 MHz processor
  last_pfn = 0xdf00 max_arch_pfn = 0x400000000
  x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC
  RAMDISK: [mem 0x0e9f7000-0x0ecf1fff]
  Allocated new RAMDISK: [mem 0x0dc05000-0x0deffebb]
  Move RAMDISK from [mem 0x0e9f7000-0x0ecf1ebb] to [mem 0x0dc05000-0x0deffebb]
  ACPI: Early table checksum verification disabled
  ACPI: RSDP 0x000000000DF04000 000024 (v02 OEMID )
  ACPI: XSDT 0x000000000DF040E0 00005C (v01 OEMID  OEMTABLE 00000005 CREA 0100000D)
  ACPI: FACP 0x000000000DF04210 00010C (v05 OEMID  OEMTABLE 00000005 CREA 0100000D)
  ACPI: DSDT 0x000000000DF044E0 001BD9 (v02 OEMID  APL-SOC  00000000 INTL 20160422)
  ACPI: FACS 0x000000000DF04320 000040
  ACPI: FACS 0x000000000DF04320 000040
  ACPI: HPET 0x000000000DF04360 000038 (v01 OEMID  OEMTABLE 00000005 CREA 0100000D)
  ACPI: APIC 0x000000000DF043A0 00005A (v03                 00000000      00000000)
  ACPI: MCFG 0x000000000DF04400 00003C (v01                 00000001      00000000)
  ACPI: FPDT 0x000000000DF04440 000044 (v01 INTEL  OEMTABLE 00000005 CREA 0100000D)
  ACPI: BGRT 0x000000000DF060C0 000038 (v01 OEMID  OEMTABLE 00000005 CREA 0100000D)
  ACPI: TEST 0x000000000DF06100 00002C (v01 OEMID  OEMTABLE 00000001 CREA 01000001)
  Zone ranges:
    DMA32    [mem 0x0000000000001000-0x000000000defffff]
    Normal   empty
  Movable zone start for each node
  Early memory node ranges
    node   0: [mem 0x0000000000001000-0x000000000009ffff]
    node   0: [mem 0x0000000000100000-0x000000000defffff]
  Zeroed struct page in unavailable ranges: 8545 pages
  Initmem setup node 0 [mem 0x0000000000001000-0x000000000defffff]
  ACPI: PM-Timer IO Port: 0x408
  ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
  IOAPIC[0]: apic_id 1, version 32, address 0xfec00000, GSI 0-23
  ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
  ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
  Using ACPI (MADT) for SMP configuration information
  ACPI: HPET id: 0x0 base: 0xfed00000
  smpboot: Allowing 1 CPUs, 0 hotplug CPUs
  [mem 0x10000000-0xfeffffff] available for PCI devices
  clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 764551960021156s
  setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:1 nr_node_ids:1
  percpu: Embedded 39 pages/cpu s129368 r0 d30376 u2097152
  Built 1 zonelists, mobility grouping on.  Total pages: 56119
  Kernel command line: console=ttyS0,115200n8  acpi_rsdp=0xDF04000
  Dentry cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
  Inode-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
  mem auto-init: stack:off, heap alloc:off, heap free:off
  Memory: 207292K/227964K available (6146K kernel code, 730K rwdata, 720K rodata, 764K init, 540K bss)
  rcu: Hierarchical RCU implementation.
  rcu:    RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
  rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
  rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
  NR_IRQS: 4352, nr_irqs: 256, preallocated irqs: 16
  Console: colour dummy device 80x25
  printk: console [ttyS0] enabled
  ACPI: Core revision 20201113
  clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
  APIC: Switch to symmetric I/O mode setup
  ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
  clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x2f75c6d054c, max_idle_ns: 4407952564s
  Calibrating delay loop (skipped), value calculated using timer frequency.. 6585.08 BogoMIPS (lpj=13)
  pid_max: default: 4096 minimum: 301
  Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
  Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
  Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
  Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
  Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
  Spectre V2 : Mitigation: Full AMD retpoline
  Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
  Speculative Store Bypass: Vulnerable
  Freeing SMP alternatives memory: 8K
  smpboot: CPU0: AMD QEMU Virtual CPU version 2.5+ (family: 0x6, model: 0x6, stepping: 0x3)
  Performance Events: PMU not available due to virtualization, using software events only.
  rcu: Hierarchical SRCU implementation.
  smp: Bringing up secondary CPUs ...
  smp: Brought up 1 node, 1 CPU
  smpboot: Max logical packages: 1
  smpboot: Total of 1 processors activated (6585.08 BogoMIPS)
  devtmpfs: initialized
  clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
  futex hash table entries: 16 (order: -2, 1024 bytes, linear)
  thermal_sys: Registered thermal governor 'step_wise'
  thermal_sys: Registered thermal governor 'user_space'
  cpuidle: using governor ladder
  ACPI: bus type PCI registered
  PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
  PCI: not using MMCONFIG
  PCI: Using configuration type 1 for base access
  ACPI: Added _OSI(Module Device)
  ACPI: Added _OSI(Processor Device)
  ACPI: Added _OSI(3.0 _SCP Extensions)
  ACPI: Added _OSI(Processor Aggregator Device)
  ACPI: Added _OSI(Linux-Dell-Video)
  ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
  ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
  ACPI: 1 ACPI AML tables successfully acquired and loaded
  ACPI: Interpreter enabled
  ACPI: (supports S0 S5)
  ACPI: Using IOAPIC for interrupt routing
  PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
  PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
  PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
  ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
  acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
  PCI host bridge to bus 0000:00
  pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
  pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
  pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
  pci_bus 0000:00: root bus resource [mem 0x80000000-0xdfffffff window]
  pci_bus 0000:00: root bus resource [mem 0x800000000-0xfffffffff window]
  pci_bus 0000:00: root bus resource [bus 00-ff]
  pci 0000:00:00.0: [8086:29c0] type 00 class 0x060000
  pci 0000:00:01.0: [1234:1111] type 00 class 0x030000
  pci 0000:00:01.0: reg 0x10: [mem 0x81000000-0x81ffffff pref]
  pci 0000:00:01.0: reg 0x18: [mem 0x80045000-0x80045fff]
  pci 0000:00:01.0: reg 0x30: [mem 0x00000000-0x0000ffff pref]
  pci 0000:00:01.0: BAR 0: assigned to efifb
  pci 0000:00:02.0: [8086:10d3] type 00 class 0x020000
  pci 0000:00:02.0: reg 0x10: [mem 0x80020000-0x8003ffff]
  pci 0000:00:02.0: reg 0x14: [mem 0x80000000-0x8001ffff]
  pci 0000:00:02.0: reg 0x18: [io  0x2060-0x207f]
  pci 0000:00:02.0: reg 0x1c: [mem 0x80040000-0x80043fff]
  pci 0000:00:02.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
  pci 0000:00:1f.0: [8086:2918] type 00 class 0x060100
  pci 0000:00:1f.0: quirk: [io  0x0400-0x047f] claimed by ICH6 ACPI/GPIO/TCO
  pci 0000:00:1f.2: [8086:2922] type 00 class 0x010601
  pci 0000:00:1f.2: reg 0x20: [io  0x2040-0x205f]
  pci 0000:00:1f.2: reg 0x24: [mem 0x80044000-0x80044fff]
  pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500
  pci 0000:00:1f.3: reg 0x20: [io  0x2000-0x203f]
  ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
  ACPI: PCI Interrupt Link [LNKA] (IRQs 5 10 11) *0
  ACPI: PCI Interrupt Link [LNKB] (IRQs 5 10 11) *0
  ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 11) *0
  ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 11) *0
  SCSI subsystem initialized
  ACPI: bus type USB registered
  usbcore: registered new interface driver usbfs
  usbcore: registered new interface driver hub
  usbcore: registered new device driver usb
  PCI: Using ACPI for IRQ routing
  hpet: 3 channels of 0 reserved for per-cpu timers
  clocksource: Switched to clocksource tsc-early
  ACPI: Failed to create genetlink family for ACPI event
  pnp: PnP ACPI init
  system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
  system 00:00: [mem 0xfed1c000-0xfed1cfff] has been reserved
  system 00:00: [mem 0xfee00000-0xfeefffff] has been reserved
  system 00:02: [io  0x01e0-0x01ef] has been reserved
  system 00:02: [io  0x0160-0x016f] has been reserved
  system 00:02: [io  0x0278-0x027f] has been reserved
  system 00:02: [io  0x0370-0x0371] has been reserved
  system 00:02: [io  0x0378-0x037f] has been reserved
  system 00:02: [io  0x0678-0x067f] has been reserved
  system 00:02: [io  0x0778-0x077f] has been reserved
  system 00:02: [io  0x0800] has been reserved
  system 00:02: [io  0xafe0-0xafe3] has been reserved
  system 00:02: [io  0xb000-0xb03f] has been reserved
  pnp: PnP ACPI: found 9 devices
  clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
  pci 0000:00:02.0: BAR 6: assigned [mem 0x80080000-0x800bffff pref]
  pci 0000:00:01.0: BAR 6: assigned [mem 0x80050000-0x8005ffff pref]
  pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
  pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
  pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
  pci_bus 0000:00: resource 7 [mem 0x80000000-0xdfffffff window]
  pci_bus 0000:00: resource 8 [mem 0x800000000-0xfffffffff window]
  pci 0000:00:01.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
  PCI: CLS 0 bytes, default 64
  Trying to unpack rootfs image as initramfs...
  Freeing initrd memory: 3052K
  workingset: timestamp_bits=62 max_order=16 bucket_order=0
  io scheduler mq-deadline registered
  io scheduler kyber registered
  efifb: probing for efifb
  efifb: framebuffer at 0x81000000, using 1876k, total 1875k
  efifb: mode is 800x600x32, linelength=3200, pages=1
  efifb: scrolling: redraw
  efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
  Console: switching to colour frame buffer device 100x37
  fb0: EFI VGA frame buffer device
  Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
  00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
  brd: module loaded
  loop: module loaded
  ahci 0000:00:1f.2: AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode
  ahci 0000:00:1f.2: flags: 64bit ncq only
  scsi host0: ahci
  scsi host1: ahci
  scsi host2: ahci
  scsi host3: ahci
  scsi host4: ahci
  scsi host5: ahci
  ata1: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044100 irq 24
  ata2: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044180 irq 24
  ata3: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044200 irq 24
  ata4: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044280 irq 24
  ata5: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044300 irq 24
  ata6: SATA max UDMA/133 abar m4096@0x80044000 port 0x80044380 irq 24
  usbcore: registered new interface driver usb-storage
  sdhci: Secure Digital Host Controller Interface driver
  sdhci: Copyright(c) Pierre Ossman
  usbcore: registered new interface driver usbhid
  usbhid: USB HID core driver
  IPI shorthand broadcast: enabled
  random: get_random_bytes called from 0xffffffff81030652 with crng_init=0
  sched_clock: Marking stable (2149545776, 31733617)->(2184090657, -2811264)
  ata2: SATA link down (SStatus 0 SControl 300)
  ata1: SATA link down (SStatus 0 SControl 300)
  ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
  ata3.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
  ata3.00: applying bridge limits
  ata3.00: configured for UDMA/100
  ata6: SATA link down (SStatus 0 SControl 300)
  ata5: SATA link down (SStatus 0 SControl 300)
  ata4: SATA link down (SStatus 0 SControl 300)
  scsi 2:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
  Freeing unused kernel image (initmem) memory: 764K
  Write protecting the kernel read-only data: 10240k
  Freeing unused kernel image (text/rodata gap) memory: 2044K
  Freeing unused kernel image (rodata/data gap) memory: 1328K
  Run /init as init process
  tsc: Refined TSC clocksource calibration: 3292.521 MHz
  clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2f75b3911c3, max_idle_ns: 440795347484 ns
  clocksource: Switched to clocksource tsc
  2021/05/26 01:17:06 Welcome to u-root!
                                _
     _   _      _ __ ___   ___ | |_
    | | | |____| '__/ _ \ / _ \| __|
    | |_| |____| | | (_) | (_) | |_
     \__,_|    |_|  \___/ \___/ \__|

  init: 2021/05/26 01:17:06 no modules found matching '/lib/modules/*.ko'
  ~/#                                                                     root@mini


