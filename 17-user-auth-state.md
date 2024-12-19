\newpage
# Chapter 17: User Authentication and State Management

User authentication and authorization are critical for securing applications and ensuring that users have appropriate access to resources. This chapter delves into the concepts of authentication, authorization, session tracking, and maintaining user state across sessions.

## User Authentication and Authorization

### Authentication
Authentication is the process of verifying a user’s identity. It answers the question: *Who are you?*
- Examples: Username/password, biometrics, multi-factor authentication (MFA).

### Authorization
Authorization determines what actions or resources a user is allowed to access. It answers the question: *What are you allowed to do?*
- Examples: Role-based access control (RBAC), access control lists (ACLs).

### Common Authentication Methods
1. **Password-Based**:
   - Simplest form of authentication.
   - Vulnerable to brute force attacks and password theft.
2. **OAuth**:
   - Used for third-party app authentication (e.g., "Login with Google").
   - Provides secure access without sharing credentials.
3. **API Keys**:
   - Used to authenticate applications accessing APIs.
   - Requires secure storage to prevent exposure.
4. **JWTs (JSON Web Tokens)**:
   - Stateless, compact tokens used for session management and authentication.
   - Encodes user information in a digitally signed format.

### Multi-Factor Authentication (MFA)
Enhances security by requiring multiple forms of verification:
1. **Something You Know**: Password or PIN.
2. **Something You Have**: Smartphone or hardware token.
3. **Something You Are**: Biometric data (e.g., fingerprint, facial recognition).

## Session Tracking

Session tracking maintains a user’s authenticated state across multiple requests or pages.

### Methods of Session Tracking
1. **Session Cookies**:
   - Stores a unique session ID in the user’s browser.
   - Commonly used in web applications.
   - Secure options include setting `HttpOnly` and `Secure` attributes.
2. **Local Storage or Session Storage**:
   - Stores session tokens in the browser.
   - Suitable for single-page applications (SPAs).
   - Vulnerable to XSS attacks if not handled carefully.
3. **Server-Side Sessions**:
   - Stores session data on the server, referenced by a session ID in cookies.
   - Ensures better control and security but requires additional storage.

### Example: Managing Sessions with Express.js
1. Install the session middleware:
   ```bash
   npm install express-session
   ```
2. Configure sessions in your application:
   ```javascript
   const express = require('express');
   const session = require('express-session');

   const app = express();

   app.use(session({
       secret: 'your-secret-key',
       resave: false,
       saveUninitialized: true,
       cookie: { secure: false } // Set to true if using HTTPS
   }));

   app.get('/', (req, res) => {
       if (!req.session.views) {
           req.session.views = 1;
       } else {
           req.session.views++;
       }
       res.send(`You have visited this page ${req.session.views} times`);
   });

   app.listen(3000, () => console.log('Server running on port 3000'));
   ```

## Permanence: Keeping User State

Maintaining user state across sessions ensures a seamless user experience. This includes remembering user preferences, authentication status, and application state.

### Techniques for State Management
1. **Persistent Cookies**:
   - Store long-lived tokens to remember user login status.
   - Ensure secure implementation to prevent theft.
2. **Token-Based Authentication**:
   - Use JWTs for stateless session management.
   - Store tokens securely in cookies or local storage.
3. **Database Persistence**:
   - Save user state (e.g., preferences, shopping carts) in a database.
   - Retrieve and restore state on login.

### Example: Using JWTs for User Authentication
1. Install necessary packages:
   ```bash
   npm install jsonwebtoken
   ```
2. Generate and verify tokens:
   ```javascript
   const jwt = require('jsonwebtoken');
   const secretKey = 'your-secret-key';

   // Generate a token
   const token = jwt.sign({ userId: 123 }, secretKey, { expiresIn: '1h' });
   console.log(`Token: ${token}`);

   // Verify the token
   jwt.verify(token, secretKey, (err, decoded) => {
       if (err) {
           console.log('Invalid token');
       } else {
           console.log('Decoded payload:', decoded);
       }
   });
   ```

## Summary

In this chapter, you learned:
- The distinction between authentication and authorization.
- Session tracking methods and how to manage user state across sessions.
- Techniques for implementing persistence, such as cookies and JWTs.

User authentication and state management are foundational to secure and user-friendly applications. In the next chapter, we’ll explore payment integration with Stripe to handle transactions effectively.

