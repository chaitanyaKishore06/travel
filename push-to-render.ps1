# Push changes to GitHub for Render deployment
Write-Host "🎨 Pushing TravelBuddy to GitHub for Render Deployment" -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Green

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Not a git repository. Please run 'git init' first." -ForegroundColor Red
    exit 1
}

Write-Host "`n📦 Adding all files..." -ForegroundColor Yellow
git add .

Write-Host "`n📝 Committing changes..." -ForegroundColor Yellow
git commit -m "Fix Dockerfile for Render deployment - multi-stage build with PostgreSQL support"

if ($LASTEXITCODE -ne 0) {
    Write-Host "ℹ️ No changes to commit or commit failed" -ForegroundColor Yellow
}

Write-Host "`n📤 Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    
    Write-Host "`n🎯 Next Steps:" -ForegroundColor Cyan
    Write-Host "1. Go to your Render dashboard" -ForegroundColor White
    Write-Host "2. If you already created the service, it will auto-deploy" -ForegroundColor White
    Write-Host "3. If not, create a new Web Service from your GitHub repo" -ForegroundColor White
    Write-Host "4. Make sure to set these environment variables:" -ForegroundColor White
    Write-Host "   - DATABASE_URL (from your PostgreSQL service)" -ForegroundColor Gray
    Write-Host "   - PORT=8080" -ForegroundColor Gray
    Write-Host "   - SPRING_PROFILES_ACTIVE=render" -ForegroundColor Gray
    
    Write-Host "`n🌐 Your app will be available at:" -ForegroundColor Green
    Write-Host "https://travelbuddy-app.onrender.com" -ForegroundColor Cyan
    
} else {
    Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
    Write-Host "Please check your git configuration and try again" -ForegroundColor Yellow
}

Write-Host "`n📚 Need help? Check RAILWAY-DEPLOYMENT-GUIDE.md" -ForegroundColor Yellow