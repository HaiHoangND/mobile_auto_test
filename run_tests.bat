@echo off
REM Run smoke tests tren Windows
REM Yeu cau: emulator chay san + Appium server da start o port 4723

echo ============================================
echo  Running Robot Framework smoke tests
echo ============================================

robot --outputdir results --loglevel INFO tests\smoke.robot

if %ERRORLEVEL% EQU 0 (
    echo.
    echo TESTS PASSED. Mo file: results\report.html
) else (
    echo.
    echo TESTS FAILED. Xem chi tiet: results\log.html
)

exit /b %ERRORLEVEL%
