require 'rubygems'
require 'bundler/setup'
require 'ruby_inspector'
require 'faraday'
require 'pry'

RubyInspector.enable(
  'ruby inspector faraday+net/http demo',
  'demonstrates how to debug http requests like a boss'
)

binding.pry

conn = Faraday.new(:url => 'http://localhost:9222') do |faraday|
  faraday.request  :url_encoded
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

response = conn.get('json')
puts "body length: #{response.body.size}"

response = conn.post(
  '/post_test', { :name => 'Steve' }
)
puts "body length: #{response.body.size}"


response = conn.put do |req|
  req.url '/put_test'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{"name": "Steve"}'
end
puts "body length: #{response.body.size}"
