@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process PowerShell -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0ClearPrintSpooler.ps1\"' -Verb RunAs"
