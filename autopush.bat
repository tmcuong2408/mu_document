:: Thêm tất cả thay đổi
git add .

:: Commit với ngày tháng
git commit -m "Auto backup: %DATE% %TIME%"

:: Push lên branch hiện tại
git push

echo ========================================
echo   Hoan thanh!
echo ========================================


@echo off
:: Khai bao thong tin ket noi SMB
set "SMB_SERVER=100.89.4.111"
set "SMB_USER=cuong"
set "SMB_PASS=@thienhadenhatbang123"
set "DRIVE_LETTER=Z:"

:: Duong dan thu muc home cua user cuong tren máy chủ SMB
set "REMOTE_PATH=\\%SMB_SERVER%\%SMB_USER%"

echo Dang ket noi toi chia se SMB...
net use %DRIVE_LETTER% "%REMOTE_PATH%" /user:%SMB_USER% "%SMB_PASS%" >nul 2>&1

if %ERRORLEVEL% NEQ 0 (
    echo [LOI] Khong the ket noi toi SMB share %REMOTE_PATH%. Vui long kiem tra lai IP, username hoac password!
    pause
    exit /b
)

echo Dang sao chep cac tep PDF sang thu muc home cuong...
:: Chi copy cac file *.pdf (giu nguyen cau truc thu muc con neu co)
xcopy "*.pdf" "%DRIVE_LETTER%\" /S /E /H /C /I /Y

echo Dang ngat ket noi SMB...
net use %DRIVE_LETTER% /delete /yes >nul 2>&1

echo ========================================
echo   Hoan thanh sao chep file PDF qua SMB!
echo ========================================
pause