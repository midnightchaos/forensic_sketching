@echo off
title Forensic Sketch - Integrated Launcher
echo =======================================================
echo 🕵️  Launching Forensic Sketch System
echo =======================================================

:: Start Backend in a new window
echo 🧠 Starting Neural Transformer Backend...
start "Forensic Backend" cmd /k "python server/main.py"

:: Give backend a moment to initialize
timeout /t 3 /nobreak > nul

:: Start Frontend in a new window
echo 🎨 Starting Face Trace Frontend...
set BROWSER=none
npm start

echo =======================================================
echo System is initializing. Check the new windows for status.
echo =======================================================
pause
