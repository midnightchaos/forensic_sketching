@echo off
title Forensic Engine - Custom Trainer
echo =======================================================
echo 🔬 Forensic Neural Engine: Custom Trainer
echo =======================================================
echo.
set /p dataset_path="📂 Enter path to folder with forensic facial samples: "

if "%dataset_path%"=="" (
    echo ❌ Error: No dataset path provided.
    pause
    exit /b
)

echo.
echo 🚀 Starting Custom Training Session...
python server/train_face.py --dataset "%dataset_path%"

echo.
echo =======================================================
echo 🎉 Training Process Complete.
echo Check server/models/custom_forensic_v1/ for results.
echo =======================================================
pause
