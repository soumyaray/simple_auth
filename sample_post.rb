require 'net/HTTP'
require 'json'
require 'openssl'

uri = URI('https://simple-auth.herokuapp.com/api/v1/users')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE # You should use VERIFY_PEER in production
req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
req.body = {name: 'Raju', email:'thimmarajus@gmail.com', password:'thisworks', bio:'TA'}.to_json
res = http.request(req)
