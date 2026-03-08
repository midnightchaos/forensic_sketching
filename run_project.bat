@echo off
title Forensic Sketch System - Unified
setlocal enabledelayedexpansion

echo =======================================================
echo     FORENSIC SKETCH SYSTEM - UNIFIED LAUNCHER
echo =======================================================
echo.

:: 1. Update venv
echo [0/2] Updating dependencies...
call venv\Scripts\pip install -r requirements.txt

:: 2. Start Unified Backend
echo [1/2] Starting Unified Backend (Port 5000)...
start "Backend - Unified" cmd /c "venv\Scripts\python server\main.py"

echo.
echo Waiting for backend models to load...
timeout /t 15 /nobreak > nul

:: 3. Start Frontend
echo [2/2] Starting React Frontend (Port 3000)...
start "Frontend - React" cmd /c "npm start"

echo.
echo =======================================================
echo System is launching. 
echo Please wait for the React tab to open in your browser.
echo =======================================================
echo.
pause
