# JWTSploit-HMAC-algSwap-admin
Ruby script made to solve JWT attack challenge. Swaps algorithim in JWT header from RS256 to HS256 and swaps user value in JWT payload to admin. Verifies signature with public key file. Decodes JWT value and prints to standard output, also prints new JWT value for admin user.

**To use change TOKEN value to the JWT of your test user, change value on line 16 to your test user, change public key file name to name of the public key file you are using to verify signature**

Use Curl or Burp to submit request with the generated admin JWT
