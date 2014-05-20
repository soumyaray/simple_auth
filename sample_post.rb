require 'net/HTTP'
require 'json'
require 'openssl'

# Setup URI for HTTP connection
uri = URI('https://simple-auth.herokuapp.com/api/v1/users')
http = Net::HTTP.new(uri.host, uri.port)

# Setup for HTTPS connection
http.use_ssl = true
# TODO: use VERIFY_PEER verification mode in production environment
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# Setup HTTP request object
req = Net::HTTP::Post.new(uri,
  initheader = {'Content-Type' =>'application/json'})
req.body = {
  name: 'Raju', email:'thimmarajus@gmail.com',
  password:'thisworks', bio:'TA'
}.to_json

# Send request and wait for HTTP response
res = http.request(req)
