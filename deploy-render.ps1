# Render Deployment Script for TravelBuddy
Write-Host "🎨 TravelBuddy Render Deployment Script" -ForegroundColor Green
Write-Host "=======================================" -ForegroundColor Green

# Check if Maven wrapper exists
if (-not (Test-Path ".\mvnw.cmd")) {
    Write-Host "❌ Maven wrapper not found. Please run this script from the project root directory." -ForegroundColor Red
    exit 1
}

Write-Host "`n📦 Step 1: Building WAR file with PostgreSQL support..." -ForegroundColor Yellow
$env:JAVA_HOME = "C:\Program Files\Java\jdk-22"
.\mvnw.cmd clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Maven build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ WAR file built successfully" -ForegroundColor Green

Write-Host "`n🐳 Step 2: Building Docker image for Render..." -ForegroundColor Yellow
docker build -t travelbuddy-render .

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker image built successfully" -ForegroundColor Green

Write-Host "`n📤 Step 3: Push changes to GitHub..." -ForegroundColor Yellow
Write-Host "Run these commands to update your GitHub repository:" -ForegroundColor Cyan
Write-Host "git add ." -ForegroundColor Gray
Write-Host "git commit -m 'Add PostgreSQL support for Render deployment'" -ForegroundColor Gray
Write-Host "git push origin main" -ForegroundColor Gray

Write-Host "`n🎨 Next Steps for Render Deployment:" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green

Write-Host "`n1. 🌐 Go to Render:" -ForegroundColor White
Write-Host "   https://render.com" -ForegroundColor Cyan

Write-Host "`n2. 🔗 Create Web Service:" -ForegroundColor White
Write-Host "   - Click 'New +' → 'Web Service'" -ForegroundColor Gray
Write-Host "   - Connect your GitHub repository" -ForegroundColor Gray
Write-Host "   - Select 'travel' repository" -ForegroundColor Gray

Write-Host "`n3. ⚙️ Configure Service:" -ForegroundColor White
Write-Host "   Name: travelbuddy-app" -ForegroundColor Gray
Write-Host "   Runtime: Docker" -ForegroundColor Gray
Write-Host "   Instance Type: Free (for testing)" -ForegroundColor Gray

Write-Host "`n4. 🗄️ Create PostgreSQL Database:" -ForegroundColor White
Write-Host "   - Click 'New +' → 'PostgreSQL'" -ForegroundColor Gray
Write-Host "   - Name: travelbuddy-db" -ForegroundColor Gray
Write-Host "   - Plan: Free" -ForegroundColor Gray

Write-Host "`n5. 🔧 Set Environment Variables:" -ForegroundColor White
Write-Host "   In your Web Service → Environment:" -ForegroundColor Gray
Write-Host "   DATABASE_URL = [Copy from PostgreSQL service]" -ForegroundColor Gray
Write-Host "   PORT = 8080" -ForegroundColor Gray
Write-Host "   SPRING_PROFILES_ACTIVE = render" -ForegroundColor Gray

Write-Host "`n6. 🚀 Deploy:" -ForegroundColor White
Write-Host "   Click 'Deploy Latest Commit'" -ForegroundColor Gray

Write-Host "`n💡 Pro Tips:" -ForegroundColor Yellow
Write-Host "   - Render automatically redeploys when you push to GitHub" -ForegroundColor Cyan
Write-Host "   - Free tier includes 750 hours/month" -ForegroundColor Cyan
Write-Host "   - PostgreSQL free tier: 1GB storage, 1 month retention" -ForegroundColor Cyan
Write-Host "   - Your app will be available at: https://travelbuddy-app.onrender.com" -ForegroundColor Cyan

Write-Host "`n📚 Documentation:" -ForegroundColor Yellow
Write-Host "   - Render Docs: https://render.com/docs" -ForegroundColor Cyan
Write-Host "   - Support: https://render.com/support" -ForegroundColor Cyan

Write-Host "`n✨ Ready for Render deployment!" -ForegroundColor Green