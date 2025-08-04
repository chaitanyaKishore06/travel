# TravelBuddy - Railway Deployment Guide

## Overview
This guide explains how to deploy your Spring Boot WAR application to Railway using Docker.

## Prerequisites
1. Railway account (https://railway.app)
2. Git repository with your code
3. Docker installed locally (for testing)

## Deployment Steps

### 1. Push Code to GitHub
```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin <your-github-repo-url>
git push -u origin main
```

### 2. Create Railway Project
1. Go to https://railway.app
2. Click "New Project"
3. Select "Deploy from GitHub repo"
4. Choose your repository
5. Railway will automatically detect the Dockerfile

### 3. Add MySQL Database
1. In your Railway project dashboard
2. Click "New Service"
3. Select "Database" → "MySQL"
4. Railway will create a MySQL instance

### 4. Configure Environment Variables
In Railway project settings, add these environment variables:

**Required Variables:**
- `DATABASE_URL`: `jdbc:mysql://${{MySQL.MYSQL_PRIVATE_URL}}/travelbuddy`
- `DATABASE_USERNAME`: `${{MySQL.MYSQL_USER}}`
- `DATABASE_PASSWORD`: `${{MySQL.MYSQL_PASSWORD}}`
- `PORT`: `8080`

**Optional Variables (if using Stripe):**
- `STRIPE_SECRET_KEY`: your-stripe-secret-key
- `STRIPE_PUBLISHABLE_KEY`: your-stripe-publishable-key

### 5. Database Setup
Railway MySQL will automatically create the database. Your application will create tables on first run due to `spring.jpa.hibernate.ddl-auto=update`.

### 6. Deploy
Railway will automatically deploy when you push to your main branch.

## File Structure
```
TravelBuddy/
├── Dockerfile                 # Docker configuration
├── railway.toml              # Railway configuration
├── .dockerignore             # Docker ignore file
├── pom.xml                   # Maven configuration
├── src/
│   ├── main/
│   │   ├── java/             # Java source code
│   │   ├── resources/        # Application properties
│   │   └── webapp/           # JSP, CSS, JS files
│   └── test/
└── target/
    └── TravelBuddy-0.0.1-SNAPSHOT.war  # Built WAR file
```

## Important Notes

### Why Docker for WAR files?
- WAR files need a servlet container (Tomcat) to run
- Docker provides consistent runtime environment
- Railway supports Docker deployments
- Better control over deployment environment

### Database Configuration
- Uses environment variables for database connection
- Supports both local development and production
- Automatic table creation via Hibernate

### File Uploads
- Upload directory is created in Docker container
- For production, consider using cloud storage (AWS S3, etc.)

### Health Checks
- Docker includes health check configuration
- Railway monitors application health automatically

## Troubleshooting

### Build Issues
```bash
# Rebuild WAR file
./mvnw clean package -DskipTests

# Rebuild Docker image
docker build -t travelbuddy-app .
```

### Database Connection Issues
- Check environment variables in Railway dashboard
- Ensure MySQL service is running
- Verify database URL format

### Application Not Starting
- Check Railway logs in dashboard
- Verify Dockerfile configuration
- Ensure WAR file exists in target directory

## Local Testing
```bash
# Build WAR file
./mvnw clean package -DskipTests

# Build Docker image
docker build -t travelbuddy-app .

# Run with environment variables
docker run -p 8080:8080 \
  -e DATABASE_URL=jdbc:mysql://localhost:3306/tra \
  -e DATABASE_USERNAME=root \
  -e DATABASE_PASSWORD=root \
  travelbuddy-app
```

## Production Considerations
1. **Security**: Use strong database passwords
2. **Monitoring**: Enable Railway metrics
3. **Backups**: Set up database backups
4. **SSL**: Railway provides HTTPS automatically
5. **Domain**: Configure custom domain if needed
6. **Scaling**: Railway supports horizontal scaling

## Support
- Railway Documentation: https://docs.railway.app
- Railway Discord: https://discord.gg/railway
- Spring Boot Documentation: https://spring.io/projects/spring-boot