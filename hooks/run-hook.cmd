#!/usr/bin/env cmd.exe
:: Windows polyglot launcher for hooks
:: This file is both a valid batch script and can invoke bash scripts

@echo off
setlocal enabledelayedexpansion

:: Get script directory
set "SCRIPT_DIR=%~dp0"
set "PLUGIN_ROOT=%SCRIPT_DIR%.."

:: Check if running in bash environment
where bash >nul 2>&1
if %ERRORLEVEL% equ 0 (
    :: Use bash if available (Git Bash, WSL, etc.)
    bash "%SCRIPT_DIR%%~1"
    exit /b %ERRORLEVEL%
)

:: Fallback: try to find common bash locations
if exist "C:\Program Files\Git\bin\bash.exe" (
    "C:\Program Files\Git\bin\bash.exe" "%SCRIPT_DIR%%~1"
    exit /b %ERRORLEVEL%
)

if exist "C:\Program Files (x86)\Git\bin\bash.exe" (
    "C:\Program Files (x86)\Git\bin\bash.exe" "%SCRIPT_DIR%%~1"
    exit /b %ERRORLEVEL%
)

:: If no bash found, try WSL
where wsl >nul 2>&1
if %ERRORLEVEL% equ 0 (
    wsl bash "%SCRIPT_DIR%%~1"
    exit /b %ERRORLEVEL%
)

echo Error: No bash environment found. Please install Git for Windows or enable WSL.
exit /b 1
