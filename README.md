# Windows Spooler Fix

A simple PowerShell and batch script to clear the print queue, restart the spooler service, and bring printers back online.

This repository contains a PowerShell script (`RunSpoolerCleaner.ps1`) and a batch file (`RunSpoolerCleaner.bat`) designed to help you clear the print queue, restart the print spooler service, and ensure printers are set to online mode. This is particularly useful when dealing with stuck print jobs or offline printers.

---

## Description

The `RunSpoolerCleaner.ps1` script performs the following tasks:
1. **Stops the Print Spooler Service**: Temporarily stops the print spooler service to clear the print queue.
2. **Clears the Print Queue**: Deletes all files in the `C:\Windows\System32\spool\PRINTERS` folder.
3. **Restarts the Print Spooler Service**: Restarts the service to resume normal printing operations.
4. **Disables "Use Printer Offline" Mode**: Ensures all printers are set to online mode if they were previously offline.

The `RunSpoolerCleaner.bat` file is a wrapper that runs the PowerShell script with administrative privileges.

---

## Prerequisites

- **Windows Operating System**: This script is designed for Windows systems.
- **Administrator Privileges**: The script must be run as an administrator to stop/start services and modify system files.

---

## How to Use

1. **Run the Script**:
   - Double-click the `RunSpoolerCleaner.bat` file to execute the script.
   - If prompted, grant administrative privileges to the script.

2. **Monitor the Output**:
   - The script will display messages in the PowerShell window, indicating its progress and any errors encountered.

---

## Files

- **RunSpoolerCleaner.ps1**: The main PowerShell script that performs the cleanup tasks.
- **RunSpoolerCleaner.bat**: A batch file that runs the PowerShell script with administrative privileges.

---

## Notes

- **Backup**: Ensure you have no critical print jobs before running the script, as it will clear the entire print queue.
- **Error Handling**: The script includes basic error handling to notify you of any issues during execution.
- **Compatibility**: Tested on Windows 10 and Windows 11. Should work on other Windows versions with PowerShell 5.1 or later.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
