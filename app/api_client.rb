require 'faraday'
 
client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
end
 
response = client.post do |req|
  req.url '/api/v1/users'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "user": {"name": "test user"} }'
end

require 'oj'
 
# client here...
client = Faraday.new(url: 'http://localhost:3000') do |config|
    config.adapter  Faraday.default_adapter
    config.token_auth('bf10d9f864021110e5d39c5458b6ecbd')
end
   
response = client.post do |req|
    req.url '/api/v1/posts'
    req.headers['Content-Type'] = 'application/json'
    req.body = '{ "post": {"title": "Title", "body": "Text"} }'
end

response = client.delete do |req|
    req.url '/api/v1/posts/1'
    req.headers['Content-Type'] = 'application/json'
end
 
puts Oj.load(response.body)
puts response.status