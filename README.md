# DecrapifyWindows

## Overview
This PowerShell script automates the removal of pre-installed (bloatware) applications on Windows systems using AppxPackage. It reads a configuration file (`Config.xml`) that contains a list of applications to be removed and logs the actions taken.

## Features
- Reads a list of apps to remove from `Config.xml`
- Removes AppxPackages using `Remove-AppxPackage`
- Supports system-wide removal with `-AllUsers`
- Logs all actions to `Decrapify.log`

## Prerequisites
- Windows 10 or later
- PowerShell 5.1 or later
- Administrator privileges

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/kfuras/decrapify-windows.git
   cd decrapify-windows
   ```
2. Ensure you have the necessary permissions:
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## Usage
1. Modify the `Config.xml` file to specify the applications you want to remove. Example:
   ```xml
   <Config>
       <RemoveApps>
           <App>Microsoft.SkypeApp</App>
           <App>Microsoft.XboxGameOverlay</App>
       </RemoveApps>
   </Config>
   ```
2. Run the script as administrator from the folder where it was downloaded:
   ```powershell
   .\Decrapify.ps1
   ```
3. The log file (`Decrapify.log`) is stored in the same folder where the script is run.

## Logging
The script logs all actions to `Decrapify.log` located in the same directory as the script.
