\newpage
# Chapter 12: Authentication and Authorization

Authentication and authorization are fundamental to securing applications and ensuring that users have appropriate access to resources. This chapter delves into key concepts and mechanisms, including Multi-Factor Authentication (MFA), OAuth, API tokens, session tokens, and JSON Web Tokens (JWTs).

## Understanding Authentication and Authorization

### Authentication
Authentication verifies the identity of a user or system. It answers the question: *Who are you?*
- Examples: Username and password, biometrics, MFA.

### Authorization
Authorization determines the actions or resources a user is allowed to access. It answers the question: *What can you do?*
- Examples: Role-based access control (RBAC), access control lists (ACLs).

## Multi-Factor Authentication (MFA)

MFA enhances security by requiring multiple forms of verification:
1. **Something You Know**: Password or PIN.
2. **Something You Have**: Smartphone or security token.
3. **Something You Are**: Biometric verification (e.g., fingerprint, facial recognition).

### Benefits of MFA
- Protects against credential theft.
- Reduces the risk of unauthorized access.

### Implementing MFA
1. **App-Based**: Use apps like Google Authenticator or Authy for time-based one-time passwords (TOTP).
2. **SMS-Based**: Send one-time codes via SMS (less secure).
3. **Hardware Tokens**: Use devices like YubiKeys for secure authentication.

## OAuth

OAuth is an open standard for authorization. It allows third-party applications to access user resources without exposing passwords.

### OAuth Workflow
1. **User Authentication**: The user logs into an identity provider (e.g., Google, Facebook).
2. **Authorization Grant**: The user grants permission to a third-party app.
3. **Access Token**: The app receives a token to access user resources.

### Use Cases
- Social login (e.g., “Log in with Google”).
- API access for third-party apps.

## API Tokens

API tokens authenticate applications accessing APIs. They are unique strings issued to developers or systems.

### Characteristics
- **Static Tokens**: Manually generated and long-lived.
- **Dynamic Tokens**: Time-limited and require periodic renewal.

### Best Practices
1. Rotate tokens regularly.
2. Store tokens securely (e.g., in environment variables).
3. Use scopes to limit token permissions.

## Session Tokens

Session tokens maintain a user’s authenticated state during a session. They are often stored as cookies or in local storage.

### How Session Tokens Work
1. **Login**: The server generates a session token after successful authentication.
2. **Storage**: The token is sent to the client and stored.
3. **Validation**: The token is sent with each request to validate the user.

### Risks
- **Session Hijacking**: Tokens can be stolen if transmitted over insecure connections.
- **Mitigation**: Use HTTPS and set secure cookie attributes (e.g., HttpOnly, Secure).

## JSON Web Tokens (JWTs)

JWTs are compact, self-contained tokens used for transmitting information securely between parties.

### Structure
1. **Header**: Metadata about the token (e.g., algorithm, type).
2. **Payload**: Claims, such as user ID and roles.
3. **Signature**: Ensures token integrity.

### Example
```json
header = {
  "alg": "HS256",
  "typ": "JWT"
}

payload = {
  "sub": "1234567890",
  "name": "John Doe",
  "admin": true
}

signature = HMACSHA256(base64UrlEncode(header) + "." + base64UrlEncode(payload), secret)
```

### Benefits
- Stateless: The server doesn’t need to store session data.
- Flexible: Can include additional information (e.g., roles).

### Best Practices
1. Use short expiration times.
2. Store sensitive claims securely.
3. Rotate signing keys periodically.

## Hands-On Exercise: Implementing OAuth and JWT

### Step 1: Set Up OAuth
1. Register your app with an identity provider (e.g., Google, GitHub).
2. Obtain client credentials (client ID and secret).
3. Redirect users to the provider’s login page.
4. Exchange the authorization code for an access token.

### Step 2: Use JWTs for API Authentication
1. Generate JWTs after user authentication.
2. Add the token to the Authorization header of API requests:
   ```http
   Authorization: Bearer <token>
   ```
3. Verify the token on the server using the signing key.

## Summary

In this chapter, you learned:
- The distinction between authentication and authorization.
- How MFA enhances security by combining multiple verification factors.
- OAuth workflows and their role in third-party app authorization.
- The use of API tokens, session tokens, and JWTs for securing applications.
- Best practices for managing tokens securely.

Authentication and authorization are pillars of application security. In the next chapter, we’ll explore payment integration with Stripe, focusing on secure and efficient handling of financial transactions.

