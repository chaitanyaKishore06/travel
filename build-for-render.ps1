# Build WAR file locally and prepare for Render deployment
Write-Host "🎨 Building TravelBuddy for Render Deployment" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green

# Check if Maven wrapper exists
if (-not (Test-Path ".\mvnw.cmd")) {
    Write-Host "❌ Maven wrapper not found. Please run this script from the project root directory." -ForegroundColor Red
    exit 1
}

Write-Host "`n📦 Step 1: Building WAR file locally..." -ForegroundColor Yellow
$env:JAVA_HOME = "C:\Program Files\Java\jdk-22"
.\mvnw.cmd clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Maven build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ WAR file built successfully" -ForegroundColor Green

Write-Host "`n📁 Step 2: Copying WAR file to root directory..." -ForegroundColor Yellow
if (Test-Path "target\TravelBuddy-0.0.1-SNAPSHOT.war") {
    Copy-Item "target\TravelBuddy-0.0.1-SNAPSHOT.war" "TravelBuddy-0.0.1-SNAPSHOT.war"
    Write-Host "✅ WAR file copied to root directory" -ForegroundColor Green
} else {
    Write-Host "❌ WAR file not found in target directory" -ForegroundColor Red
    exit 1
}

Write-Host "`n🐳 Step 3: Switching to simple Dockerfile..." -ForegroundColor Yellow
if (Test-Path "Dockerfile.simple") {
    Copy-Item "Dockerfile.simple" "Dockerfile" -Force
    Write-Host "✅ Using simple Dockerfile (no Maven build in container)" -ForegroundColor Green
} else {
    Write-Host "❌ Dockerfile.simple not found" -ForegroundColor Red
    exit 1
}

Write-Host "`n📤 Step 4: Ready to push to GitHub..." -ForegroundColor Yellow
Write-Host "Run these commands to deploy to Render:" -ForegroundColor Cyan
Write-Host "git add ." -ForegroundColor Gray
Write-Host "git commit -m 'Add pre-built WAR file for Render deployment'" -ForegroundColor Gray
Write-Host "git push origin main" -ForegroundColor Gray

Write-Host "`n🎯 What this script did:" -ForegroundColor Green
Write-Host "✅ Built WAR file locally using Maven" -ForegroundColor White
Write-Host "✅ Copied WAR file to root directory" -ForegroundColor White
Write-Host "✅ Switched to simple Dockerfile (no Maven in container)" -ForegroundColor White
Write-Host "✅ Ready for Render deployment" -ForegroundColor White

Write-Host "`n💡 This approach avoids Maven dependency issues in Render!" -ForegroundColor Yellow

Write-Host "`n🚀 Next Steps:" -ForegroundColor Green
Write-Host "1. Push the changes to GitHub" -ForegroundColor White
Write-Host "2. Render will use the simple Dockerfile" -ForegroundColor White
Write-Host "3. No Maven build needed in container" -ForegroundColor White
Write-Host "4. Deployment should succeed!" -ForegroundColor White