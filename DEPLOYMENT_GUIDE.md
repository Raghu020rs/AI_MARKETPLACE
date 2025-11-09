# BotShop Deployment Guide for Ezuhost

## 📦 Deployment Package Contents

This deployment folder contains everything needed to deploy BotShop to Ezuhost.

## 🚀 Deployment Steps

### 1. Upload Files to Ezuhost

**Option A: Using File Manager**
1. Log in to your Ezuhost cPanel
2. Open File Manager
3. Navigate to `public_html` (or your domain's root directory)
4. Upload ALL files from the `build` folder to `public_html`
5. Upload the `.htaccess` file to `public_html` (important for routing)

**Option B: Using FTP**
1. Connect to your Ezuhost FTP
2. Navigate to `public_html`
3. Upload all files from `build` folder
4. Upload `.htaccess` file

### 2. Configure Backend API

**Update API URL in Frontend:**
Before deployment, make sure your backend API is deployed and update the API URL:

1. In your local project, open `.env` or update API configuration
2. Set `VITE_API_URL=https://your-backend-url.com/api`
3. Rebuild: `npm run build`
4. Re-upload the build files

**Backend Deployment Options:**
- Deploy backend to Railway, Render, or Vercel
- Or deploy to the same Ezuhost server in a subdirectory (e.g., `/api`)

### 3. Database Configuration

Make sure your MongoDB is accessible:
- MongoDB Atlas (recommended): Get connection string from MongoDB Atlas
- Update backend `.env` with MongoDB connection string

### 4. Environment Variables

Create `.env` file in your backend with:
```
MONGODB_URI=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret_key
PORT=5000
NODE_ENV=production
FRONTEND_URL=https://botshop.in
```

### 5. SSL Certificate (HTTPS)

1. In Ezuhost cPanel, go to SSL/TLS
2. Install free Let's Encrypt SSL certificate
3. Enable "Force HTTPS" in .htaccess (uncomment lines in .htaccess)

### 6. Domain Configuration

1. Point your domain (botshop.in) to Ezuhost nameservers
2. In Ezuhost cPanel, add domain in "Addon Domains" or "Primary Domain"
3. Wait for DNS propagation (up to 48 hours)

### 7. Test Your Deployment

1. Visit: `https://botshop.in`
2. Test all features:
   - Browse categories
   - Search tools
   - Login/Register
   - Bookmarks
   - Compare tools
   - Responsive design

## 🔧 Troubleshooting

### 404 Errors on Refresh
- Make sure `.htaccess` file is uploaded
- Enable `mod_rewrite` in Apache (ask Ezuhost support)

### API Connection Failed
- Check CORS settings in backend
- Verify backend URL is correct
- Check network tab in browser DevTools

### Blank Page
- Check browser console for errors
- Verify all files uploaded correctly
- Check file permissions (644 for files, 755 for directories)

### Images Not Loading
- Check image paths are relative
- Verify assets folder uploaded correctly

## 📁 File Structure on Server

```
public_html/
├── index.html           # Main HTML file
├── .htaccess           # Apache configuration
├── assets/             # CSS, JS, images
│   ├── index-[hash].js
│   ├── index-[hash].css
│   └── [other assets]
└── [other build files]
```

## 🔐 Security Checklist

- ✅ SSL certificate installed
- ✅ Force HTTPS enabled
- ✅ Security headers configured
- ✅ Environment variables secured
- ✅ MongoDB connection secured
- ✅ JWT secret is strong and unique
- ✅ CORS properly configured

## 📱 Post-Deployment Tasks

1. **Test on Multiple Devices**
   - Desktop browsers (Chrome, Firefox, Safari)
   - Mobile devices (iOS, Android)
   - Different screen sizes

2. **Performance Optimization**
   - Enable Cloudflare (optional)
   - Enable caching in cPanel
   - Monitor with Google PageSpeed Insights

3. **SEO Setup**
   - Submit sitemap to Google Search Console
   - Add Google Analytics
   - Set up social media meta tags

4. **Monitoring**
   - Set up uptime monitoring (e.g., UptimeRobot)
   - Monitor error logs in cPanel
   - Track user analytics

## 🆘 Support

If you encounter issues:
1. Check Ezuhost documentation
2. Contact Ezuhost support
3. Check browser console for errors
4. Review Apache error logs in cPanel

## 📞 Quick Links

- Ezuhost cPanel: https://your-server.ezuhost.com:2083
- File Manager: cPanel → File Manager
- SSL/TLS: cPanel → SSL/TLS Status
- Error Logs: cPanel → Errors

---

**Deployed by:** BotShop Team
**Deployment Date:** October 22, 2025
**Version:** 1.0.0
