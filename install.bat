@echo off
REM AI Receptionist Agent - Installation Script for Windows

echo ======================================
echo AI Receptionist Agent - Setup
echo ======================================
echo.

REM Check for Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo X Node.js is not installed.
    echo Please install Node.js v18 or higher from https://nodejs.org/
    pause
    exit /b 1
)

echo ✓ Node.js detected
node -v
echo.

REM Check Node.js version (extract major version)
for /f "tokens=1,2 delims=.v" %%a in ('node -v') do set NODE_MAJOR=%%a
if %NODE_MAJOR% LSS 18 (
    echo ⚠️  Node.js version 18 or higher is required.
    echo Current version: 
    node -v
    echo Please upgrade Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo ✓ Node.js version is compatible
echo.

REM Check for npm
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo X npm is not installed.
    pause
    exit /b 1
)

echo ✓ npm detected
npm -v
echo.

REM Install n8n
echo Installing n8n...
echo.

set /p CHOICE="Do you want to install n8n globally? (Y/N): "
if /i "%CHOICE%"=="Y" (
    echo Installing n8n globally...
    npm install -g n8n
    echo.
    echo ✓ n8n installed successfully!
) else (
    echo Installing n8n locally...
    npm install
    echo.
    echo ✓ Dependencies installed successfully!
    echo Use 'npm run start' to run n8n
)

echo.
echo ======================================
echo Installation Complete!
echo ======================================
echo.
echo Next steps:
echo 1. Start n8n:
echo    - If installed globally: n8n start
echo    - If installed locally: npm run start
echo.
echo 2. Open http://localhost:5678 in your browser
echo.
echo 3. Import the workflow:
echo    - Go to Workflows - Import from File
echo    - Select: AI_Receptionist_Agent (1).json
echo.
echo 4. Configure credentials:
echo    - OpenAI API (get key from https://platform.openai.com/api-keys)
echo    - Google Calendar OAuth2
echo.
echo For more details, see README.md
echo.
pause
