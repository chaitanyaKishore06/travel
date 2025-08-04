# TravelBuddy Deployment Script for Railway
# This script helps you deploy your Spring Boot WAR application to Railway

Write-Host "🚀 TravelBuddy Railway Deployment Script" -ForegroundColor Green
Write-Host "=======================================" -ForegroundColor Green

# Check if Maven wrapper exists
if (-not (Test-Path ".\mvnw.cmd")) {
    Write-Host "❌ Maven wrapper not found. Please run this script from the project root directory." -ForegroundColor Red
    exit 1
}

# Check if Docker is running
try {
    docker version | Out-Null
    Write-Host "✅ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker is not running. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

Write-Host "`n📦 Step 1: Building WAR file..." -ForegroundColor Yellow
$env:JAVA_HOME = "C:\Program Files\Java\jdk-22"
.\mvnw.cmd clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Maven build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ WAR file built successfully" -ForegroundColor Green

Write-Host "`n🐳 Step 2: Building Docker image..." -ForegroundColor Yellow
docker build -t travelbuddy-app .

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker image built successfully" -ForegroundColor Green

Write-Host "`n🧪 Step 3: Testing Docker image locally..." -ForegroundColor Yellow
Write-Host "Starting container on port 8080..." -ForegroundColor Cyan

# Stop any existing test container
docker stop travelbuddy-test 2>$null
docker rm travelbuddy-test 2>$null

# Start new test container
docker run -d -p 8080:8080 --name travelbuddy-test travelbuddy-app

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to start Docker container!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Container started successfully" -ForegroundColor Green
Write-Host "🌐 Application should be available at: http://localhost:8080" -ForegroundColor Cyan

# Wait a bit for the application to start
Write-Host "`nWaiting for application to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check container status
$containerStatus = docker ps --filter "name=travelbuddy-test" --format "table {{.Status}}"
Write-Host "Container Status: $containerStatus" -ForegroundColor Cyan

# Show logs
Write-Host "`n📋 Recent logs:" -ForegroundColor Yellow
docker logs --tail 20 travelbuddy-test

Write-Host "`n🎯 Next Steps for Railway Deployment:" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green
Write-Host "1. Push your code to GitHub:" -ForegroundColor White
Write-Host "   git init" -ForegroundColor Gray
Write-Host "   git add ." -ForegroundColor Gray
Write-Host "   git commit -m 'Initial commit'" -ForegroundColor Gray
Write-Host "   git branch -M main" -ForegroundColor Gray
Write-Host "   git remote add origin <your-github-repo-url>" -ForegroundColor Gray
Write-Host "   git push -u origin main" -ForegroundColor Gray

Write-Host "`n2. Create Railway Project:" -ForegroundColor White
Write-Host "   - Go to https://railway.app" -ForegroundColor Gray
Write-Host "   - Click 'New Project'" -ForegroundColor Gray
Write-Host "   - Select 'Deploy from GitHub repo'" -ForegroundColor Gray
Write-Host "   - Choose your repository" -ForegroundColor Gray

Write-Host "`n3. Add MySQL Database:" -ForegroundColor White
Write-Host "   - In Railway dashboard, click 'New Service'" -ForegroundColor Gray
Write-Host "   - Select 'Database' → 'MySQL'" -ForegroundColor Gray

Write-Host "`n4. Configure Environment Variables:" -ForegroundColor White
Write-Host "   DATABASE_URL: jdbc:mysql://`${{MySQL.MYSQL_PRIVATE_URL}}/travelbuddy" -ForegroundColor Gray
Write-Host "   DATABASE_USERNAME: `${{MySQL.MYSQL_USER}}" -ForegroundColor Gray
Write-Host "   DATABASE_PASSWORD: `${{MySQL.MYSQL_PASSWORD}}" -ForegroundColor Gray
Write-Host "   PORT: 8080" -ForegroundColor Gray

Write-Host "`n5. Deploy!" -ForegroundColor White
Write-Host "   Railway will automatically deploy when you push to main branch" -ForegroundColor Gray

Write-Host "`n📚 For detailed instructions, see README-DEPLOYMENT.md" -ForegroundColor Cyan

Write-Host "`n🛑 To stop the test container:" -ForegroundColor Yellow
Write-Host "   docker stop travelbuddy-test" -ForegroundColor Gray
Write-Host "   docker rm travelbuddy-test" -ForegroundColor Gray

Write-Host "`n✨ Deployment preparation complete!" -ForegroundColor Green