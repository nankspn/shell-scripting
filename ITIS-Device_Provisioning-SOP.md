# ITIS Device Provisioning – Standard Operating Procedure (SOP)

## 📌 Overview
This SOP outlines the **end-to-end process** for provisioning Windows 11 laptops and Ubuntu desktops in a production environment for enterprise users.  
It ensures devices are **secure, compliant, and production-ready** before handover to the end-user.

---

## 📑 Table of Contents
1. [Purpose](#1-purpose)
2. [Roles & Responsibilities](#2-roles--responsibilities)
3. [Pre-Provisioning Steps](#3-pre-provisioning-steps)
4. [BIOS/UEFI Configuration](#4-biosuefi-configuration)
5. [OS Installation & Imaging](#5-os-installation--imaging)
6. [Post-OS Configuration](#6-post-os-configuration)
7. [Quality Control (QC)](#7-quality-control-qc)
8. [Handover Process](#8-handover-process)
9. [Post-Deployment Support](#9-post-deployment-support)
10. [References](#10-references)

---

## 1. Purpose
To provide a standardized process for provisioning devices, ensuring:
- Security compliance
- Operational readiness
- User productivity from day one
- Audit traceability

---

## 2. Roles & Responsibilities

| Role                | Responsibility |
|---------------------|----------------|
| **ITIS Engineer**   | Execute provisioning, install OS/apps, perform QC |
| **Asset Management**| Manage asset tags, CMDB updates, license allocation |
| **IT Security**     | Apply hardening, perform compliance scans |
| **IT Supervisor**   | Approve final handover |
| **End User**        | Verify device and sign acknowledgment |

---
## 3A. Provisioning Workflow Diagram

```plaintext
 ┌────────────────────┐
 │ 1. Ticket Received │
 └─────────┬──────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 2. Approvals & CMDB Prep │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 3. Hardware Inspection   │
 │    & Secure Wipe         │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 4. BIOS/UEFI Configuration│
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 5. OS Installation &     │
 │    Imaging               │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 6. Post-OS Configuration │
 │    (Updates, Hardening)  │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 7. QC & Compliance Scan  │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 8. Supervisor Approval   │
 │    & User Orientation    │
 └─────────┬────────────────┘
           │
           ▼
 ┌──────────────────────────┐
 │ 9. Asset Handover & ELS  │
 └──────────────────────────┘
```
---


## 3. Pre-Provisioning Steps
1. **Request & Approval**
   - Receive request via ITSM (ServiceNow, Remedy, Jira, etc.)
   - Confirm manager approval
   - Validate device type/specs
   - Verify employee ID (for new hires)

2. **CMDB Pre-Update**
   - Reserve device in CMDB
   - Link asset to ticket ID
   - Verify device is on **Approved Vendor List (AVL)**

3. **Hardware Check**
   - Inspect device condition
   - Verify asset tag, serial, warranty
   - Secure wipe reused devices (DBAN, shred, dd)

4. **License Verification**
   - Allocate OS & software licenses in inventory

---

## 4. BIOS/UEFI Configuration
- Update firmware to latest version
- Set boot order (USB/PXE → Disk)
- Enable TPM & Secure Boot (Windows 11 compliance)
- Disable unused ports (as per policy)
- Set BIOS admin password

---

## 5. OS Installation & Imaging

### **Windows 11 Laptops**
- Deploy via **SCCM, MDT, WDS, Autopilot, or Intune**
- Join to **AD / Azure AD** during setup
- Install device drivers

### **Ubuntu Desktops**
- Deploy via **PXE boot** (Foreman, MAAS, FAI) or pre-built ISO
- Set hostname per naming convention
- Install required drivers

---

## 6. Post-OS Configuration
1. **OS Updates & Patches**
   - Install latest approved updates
   - Update AV/EDR definitions

2. **Security Hardening**
   - Apply GPO (Windows) or Ansible/Puppet hardening (Linux)
   - Enable encryption (BitLocker / LUKS)
   - Configure firewall
   - Enable audit logging
   - Store recovery keys securely (AD, MDM, KMS)

3. **Network & VLAN Setup**
   - Assign to correct VLAN (Prod/Dev/Restricted)
   - Enforce NAC policies

4. **Application Installation**
   - Productivity: Office 365, Teams, Zoom
   - Project-specific: Dev tools, SAP, VPN
   - Collaboration: Slack, Jira, Confluence
   - Configure email client & SSO

5. **Certificate Enrollment**
   - Install PKI certificates (Wi-Fi, VPN, Email)

6. **Backup Agent Setup**
   - Configure OneDrive, Druva, Veeam, etc.

---

## 7. Quality Control (QC)
- Verify:
  - Domain login
  - Network (LAN/Wi-Fi/VPN)
  - Printers
  - Mapped drives
  - Encryption enabled
  - All apps function
- Run vulnerability scan (Qualys, Nessus)
- Record image build/checksum in CMDB

---

## 8. Handover Process
1. **Approval Sign-off**
   - Supervisor approves device release
   - Security Lead approval (for restricted projects)

2. **First Login with User**
   - Verify profile creation
   - Complete MFA setup

3. **User Orientation**
   - Explain policies
   - Provide VPN & remote access guide
   - Share IT support contact info

4. **Acknowledgment**
   - User signs asset receipt form

---

## 9. Post-Deployment Support
- Keep ticket in **Early Life Support (ELS)** for 72 hours
- Monitor compliance in MDM
- Update CMDB with:
  - Assigned user
  - Location
  - Warranty info
  - Date of issue

---

## 10. References
- **IT Security Policy Document**
- **Approved Vendor List (AVL)**
- **OS Imaging Standards**
- **Asset Management Guidelines**

---

## 📌 Notes
- Always maintain **audit-ready documentation**
- Never hand over devices without **security clearance**
- Encryption keys must be **escrowed before delivery**
