#!/bin/bash

# BotShop Deployment Preparation Script
# This script prepares your application for deployment to Ezuhost

echo "================================================"
echo "   BotShop Deployment Preparation Script"
echo "================================================"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Clean previous builds
echo -e "${BLUE}Step 1: Cleaning previous builds...${NC}"
rm -rf build/
rm -rf deployment/build/
echo -e "${GREEN}✓ Cleaned successfully${NC}"
echo ""

# Step 2: Build production version
echo -e "${BLUE}Step 2: Building production version...${NC}"
npm run build
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Build completed successfully${NC}"
else
    echo -e "${YELLOW}✗ Build failed. Please fix errors and try again.${NC}"
    exit 1
fi
echo ""

# Step 3: Copy build files to deployment folder
echo -e "${BLUE}Step 3: Copying files to deployment folder...${NC}"
cp -r build/* deployment/
echo -e "${GREEN}✓ Files copied successfully${NC}"
echo ""

# Step 4: Verify .htaccess exists
echo -e "${BLUE}Step 4: Verifying .htaccess file...${NC}"
if [ -f "deployment/.htaccess" ]; then
    echo -e "${GREEN}✓ .htaccess file found${NC}"
else
    echo -e "${YELLOW}⚠ .htaccess file not found. Creating one...${NC}"
    cp deployment/.htaccess deployment/.htaccess
    echo -e "${GREEN}✓ .htaccess file created${NC}"
fi
echo ""

# Step 5: Create deployment zip
echo -e "${BLUE}Step 5: Creating deployment zip file...${NC}"
cd deployment
zip -r ../botshop-deployment.zip . -x "*.md"
cd ..
echo -e "${GREEN}✓ Deployment zip created: botshop-deployment.zip${NC}"
echo ""

# Step 6: Display summary
echo -e "${BLUE}================================================${NC}"
echo -e "${GREEN}Deployment package ready!${NC}"
echo -e "${BLUE}================================================${NC}"
echo ""
echo "📦 Deployment files location: deployment/"
echo "📦 Zip file: botshop-deployment.zip"
echo ""
echo "Next steps:"
echo "1. Upload 'botshop-deployment.zip' to Ezuhost cPanel"
echo "2. Extract in public_html directory"
echo "3. Or upload files from 'deployment/' folder directly"
echo ""
echo "Read DEPLOYMENT_GUIDE.md for detailed instructions"
echo ""
echo -e "${GREEN}Good luck with your deployment! 🚀${NC}"
