# BotShop Backend API Endpoints

Base URL: `https://your-backend-url.com/api`

## Authentication

### Register User
```
POST /auth/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "confirmPassword": "password123"
}

Response: {
  "token": "jwt_token_here",
  "user": { "id": "...", "name": "John Doe", "email": "..." }
}
```

### Login User
```
POST /auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "password123"
}

Response: {
  "token": "jwt_token_here",
  "user": { "id": "...", "name": "John Doe", "email": "..." }
}
```

### Get Current User
```
GET /auth/me
Authorization: Bearer {token}

Response: {
  "user": { "id": "...", "name": "John Doe", "email": "..." }
}
```

## AI Tools

### Get All Tools
```
GET /tools
Query Params: ?limit=10&category=text-generation&search=chatgpt

Response: [
  {
    "id": "chatgpt",
    "name": "ChatGPT",
    "description": "...",
    "category": "text-generation",
    ...
  }
]
```

### Get Tool by ID
```
GET /tools/:id

Response: {
  "id": "chatgpt",
  "name": "ChatGPT",
  ...
}
```

### Increment Tool View
```
POST /tools/:id/view

Response: {
  "success": true,
  "views": 12345
}
```

## Bookmarks

### Get User Bookmarks
```
GET /bookmarks
Authorization: Bearer {token}

Response: [
  { "toolId": "chatgpt", "createdAt": "..." },
  { "toolId": "midjourney", "createdAt": "..." }
]
```

### Add Bookmark
```
POST /bookmarks
Authorization: Bearer {token}
Content-Type: application/json

{
  "toolId": "chatgpt"
}

Response: {
  "success": true,
  "bookmark": { "toolId": "chatgpt", "createdAt": "..." }
}
```

### Remove Bookmark
```
DELETE /bookmarks/:toolId
Authorization: Bearer {token}

Response: {
  "success": true
}
```

## Submit Tool

### Submit New Tool
```
POST /tools/submit
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "My AI Tool",
  "description": "Description here",
  "category": "text-generation",
  "websiteUrl": "https://example.com",
  "developerEmail": "dev@example.com",
  "pricing": "Free",
  "features": ["Feature 1", "Feature 2"]
}

Response: {
  "success": true,
  "message": "Tool submitted for review"
}
```

## CORS Configuration

Make sure your backend has CORS enabled for your frontend domain:

```javascript
const cors = require('cors');

app.use(cors({
  origin: ['https://botshop.in', 'http://localhost:3001'],
  credentials: true
}));
```

## Error Responses

All errors follow this format:
```json
{
  "error": "Error message here",
  "message": "Detailed error description"
}
```

Status Codes:
- 200: Success
- 201: Created
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 500: Server Error
