require "uri"
require "json"
require "net/http"

url = URI("https://api.nowpayments.io/v1/auth")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Content-Type"] = "application/json"
request.body = JSON.dump({
  "email": "your_email",
  "password": "your_password"
})

response = https.request(request)
puts response.read_body
