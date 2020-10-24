@echo off
REM Simple wrapper around mpiexec to select the appropriate binary

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 

REM Copyright 2006-2018 The MathWorks, Inc.

set MATLAB_BIN_DIR=%~dp0
set MATLAB_ARCH=win64

REM Call the right mpiexec.exe
"!MATLAB_BIN_DIR!\!MATLAB_ARCH!\mpiexec" %*
