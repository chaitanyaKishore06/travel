# Railway Setup Script for TravelBuddy
# This script helps you set up your project for Railway deployment

Write-Host "🚀 TravelBuddy Railway Setup Script" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Green

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✅ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git is not installed!" -ForegroundColor Red
    Write-Host "📥 Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "   1. Download 64-bit Git for Windows Setup" -ForegroundColor Cyan
    Write-Host "   2. Install with default settings" -ForegroundColor Cyan
    Write-Host "   3. Restart PowerShell and run this script again" -ForegroundColor Cyan
    exit 1
}

# Check if we're in the right directory
if (-not (Test-Path "pom.xml")) {
    Write-Host "❌ Please run this script from the TravelBuddy project root directory" -ForegroundColor Red
    exit 1
}

Write-Host "`n📋 Pre-deployment Checklist:" -ForegroundColor Yellow
Write-Host "=============================" -ForegroundColor Yellow

# Check if WAR file exists
if (Test-Path "target\TravelBuddy-0.0.1-SNAPSHOT.war") {
    Write-Host "✅ WAR file exists" -ForegroundColor Green
} else {
    Write-Host "❌ WAR file not found. Building now..." -ForegroundColor Yellow
    $env:JAVA_HOME = "C:\Program Files\Java\jdk-22"
    .\mvnw.cmd clean package -DskipTests
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ WAR file built successfully" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to build WAR file" -ForegroundColor Red
        exit 1
    }
}

# Check if Dockerfile exists
if (Test-Path "Dockerfile") {
    Write-Host "✅ Dockerfile exists" -ForegroundColor Green
} else {
    Write-Host "❌ Dockerfile not found" -ForegroundColor Red
    exit 1
}

# Check if railway.toml exists
if (Test-Path "railway.toml") {
    Write-Host "✅ railway.toml exists" -ForegroundColor Green
} else {
    Write-Host "❌ railway.toml not found" -ForegroundColor Red
    exit 1
}

Write-Host "`n🎯 Next Steps:" -ForegroundColor Green
Write-Host "==============" -ForegroundColor Green

Write-Host "`n1. 📁 Create GitHub Repository:" -ForegroundColor White
Write-Host "   - Go to: https://github.com" -ForegroundColor Cyan
Write-Host "   - Click 'New repository'" -ForegroundColor Cyan
Write-Host "   - Name: travelbuddy-app" -ForegroundColor Cyan
Write-Host "   - Set to Public (required for Railway free tier)" -ForegroundColor Cyan
Write-Host "   - Add README file" -ForegroundColor Cyan
Write-Host "   - Copy the repository URL" -ForegroundColor Cyan

Write-Host "`n2. 📤 Push Code to GitHub:" -ForegroundColor White
Write-Host "   Run these commands in this directory:" -ForegroundColor Cyan
Write-Host "   git init" -ForegroundColor Gray
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m `"Initial commit: Spring Boot WAR application`"" -ForegroundColor Gray
Write-Host "   git branch -M main" -ForegroundColor Gray
Write-Host "   git remote add origin <YOUR_GITHUB_REPO_URL>" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray

Write-Host "`n3. 🚂 Create Railway Project:" -ForegroundColor White
Write-Host "   - Go to: https://railway.app" -ForegroundColor Cyan
Write-Host "   - Login with GitHub" -ForegroundColor Cyan
Write-Host "   - Click 'New Project'" -ForegroundColor Cyan
Write-Host "   - Select 'Deploy from GitHub repo'" -ForegroundColor Cyan
Write-Host "   - Choose your travelbuddy-app repository" -ForegroundColor Cyan

Write-Host "`n4. 🗄️ Add MySQL Database:" -ForegroundColor White
Write-Host "   - In Railway dashboard, click 'New Service'" -ForegroundColor Cyan
Write-Host "   - Select 'Database' → 'MySQL'" -ForegroundColor Cyan
Write-Host "   - Wait for deployment to complete" -ForegroundColor Cyan

Write-Host "`n5. ⚙️ Configure Environment Variables:" -ForegroundColor White
Write-Host "   Click on your App Service → Variables tab → Add:" -ForegroundColor Cyan
Write-Host "   DATABASE_URL = jdbc:mysql://`${{MySQL.MYSQL_PRIVATE_URL}}/travelbuddy" -ForegroundColor Gray
Write-Host "   DATABASE_USERNAME = `${{MySQL.MYSQL_USER}}" -ForegroundColor Gray
Write-Host "   DATABASE_PASSWORD = `${{MySQL.MYSQL_PASSWORD}}" -ForegroundColor Gray
Write-Host "   PORT = 8080" -ForegroundColor Gray
Write-Host "   SPRING_PROFILES_ACTIVE = prod" -ForegroundColor Gray

Write-Host "`n6. 🚀 Deploy!" -ForegroundColor White
Write-Host "   Railway will automatically deploy your application" -ForegroundColor Cyan
Write-Host "   Check the deployment logs for progress" -ForegroundColor Cyan
Write-Host "   Get your public URL from the dashboard" -ForegroundColor Cyan

Write-Host "`n📚 Documentation:" -ForegroundColor Yellow
Write-Host "   - Detailed guide: README-DEPLOYMENT.md" -ForegroundColor Cyan
Write-Host "   - Complete steps: RAILWAY-DEPLOYMENT-GUIDE.md" -ForegroundColor Cyan

Write-Host "`n🔧 If you need help:" -ForegroundColor Yellow
Write-Host "   - Railway Docs: https://docs.railway.app" -ForegroundColor Cyan
Write-Host "   - Railway Discord: https://discord.gg/railway" -ForegroundColor Cyan

Write-Host "`n✨ Your application is ready for Railway deployment!" -ForegroundColor Green

# Offer to open URLs
$openUrls = Read-Host "`nWould you like to open GitHub and Railway in your browser? (y/n)"
if ($openUrls -eq "y" -or $openUrls -eq "Y") {
    Start-Process "https://github.com"
    Start-Process "https://railway.app"
    Write-Host "✅ Opened GitHub and Railway in your browser" -ForegroundColor Green
}