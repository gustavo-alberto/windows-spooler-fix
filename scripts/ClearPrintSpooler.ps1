# Check if the script is running as administrator
$currUser = [Security.Principal.WindowsIdentity]::GetCurrent()
$adminRole = [Security.Principal.WindowsPrincipal]::new($currUser)
if (-not $adminRole.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run PowerShell as Administrator!" -ForegroundColor Red
    exit
}

try {
    Write-Host "Stopping the print spooler service..." -ForegroundColor Yellow
    Stop-Service -Name Spooler -Force

    Write-Host "Clearing the print queue..."

    $spoolerPath = "C:\Windows\System32\spool\PRINTERS"

    if (Test-Path $spoolerPath) {
        Remove-Item -Path "$spoolerPath\*" -Force -Recurse -ErrorAction Stop
        Write-Host "Print queue files removed successfully." -ForegroundColor Green
    } else {
        Write-Host "Spooler folder not found!" -ForegroundColor Red
    }

    Write-Host "Restarting the print spooler service..." -ForegroundColor Yellow
    Start-Service -Name Spooler

    # Wait for the service to stabilize
    Start-Sleep -Seconds 2

    # Disable "Use Printer Offline" mode
    Write-Host "Disabling 'Use Printer Offline' option..."
    Get-Printer | ForEach-Object { 
        if ($_.PrinterStatus -eq 1) { # Check if the printer is offline
            Set-Printer -Name $_.Name -WorkOffline $false
            Write-Host "Printer '$($_.Name)' is now set to online." -ForegroundColor Green
        }
    }
    Write-Host "Print queue successfully cleared!" -ForegroundColor Cyan
}
catch {
    Write-Host "`nError during execution: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Operation aborted. Please check your system." -ForegroundColor Yellow
    exit 1
}
