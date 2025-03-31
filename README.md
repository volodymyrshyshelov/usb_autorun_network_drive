# 🚀 usb_autorun_network_drive

**usb_autorun_network_drive** is a utility designed to automate the process of establishing a VPN connection upon inserting a USB drive into a Windows system. By leveraging the `autorun.inf` feature, this tool initiates a VPN connection seamlessly, enhancing user convenience and ensuring secure network access.

## 📂 Repository Contents

- `autorun.inf`: Configuration file that triggers the automatic execution of the VPN connection script when the USB drive is inserted.
- `AutoVPN.bat`: Batch script responsible for initiating the VPN connection.
- `AutoVPN.exe`: Executable version of the `AutoVPN.bat` script for environments where batch scripts are restricted.
- `vpn.ico`: Custom icon associated with the autorun action for visual identification.

## 🛠️ Prerequisites

- **Operating System**: Windows XP or later.
- **VPN Client**: Ensure that the target system has the necessary VPN client installed and configured.
- **USB Drive**: A USB flash drive with sufficient storage to hold the required files.

## 🔧 Setup Instructions

1. **Prepare the USB Drive**:
   - Format the USB drive to a compatible file system (e.g., FAT32 or NTFS).
   - Assign a unique volume label to the USB drive for easy identification.

2. **Copy Files to the USB Drive**:
   - Place the `autorun.inf`, `AutoVPN.bat`, `AutoVPN.exe`, and `vpn.ico` files in the root directory of the USB drive.

3. **Modify VPN Connection Details**:
   - Edit the `AutoVPN.bat` script to include the correct VPN connection name, username, and password. Ensure that these credentials are securely stored and handled.

4. **Enable Autorun on the Target System**:
   - Verify that the Windows system has the autorun feature enabled. Note that some systems may have autorun disabled due to security policies.

## 🚀 Usage

- **Connecting to the VPN**:
  - Insert the configured USB drive into the Windows system.
  - If autorun is enabled, the system will prompt you with the autorun options. Select the option to run the VPN connection script.
  - The script will execute, establishing the VPN connection automatically.

- **Disconnecting from the VPN**:
  - Manually disconnect the VPN connection through the VPN client interface or use a corresponding script if available.

## ⚠️ Security Considerations

- **Autorun Security Risks**:
  - Be aware that enabling autorun can pose security risks, as it may allow malicious software to execute automatically. Ensure that the USB drive comes from a trusted source.

- **Credential Management**:
  - Store VPN credentials securely. Avoid hardcoding sensitive information in scripts. Consider using encrypted storage or prompting for credentials at runtime.

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.


---

*Disclaimer: The autorun feature has been deprecated in newer versions of Windows due to security concerns. Ensure compliance with your organization's IT policies and consider the security implications before implementing this solution.*
