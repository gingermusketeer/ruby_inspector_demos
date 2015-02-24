require 'open-uri'
require "net/http"
require "uri"

class RequestController < ApplicationController
  def get
    example_com_html = open('http://example.com?param=value').read
    render html: example_com_html.html_safe
  end

  def post
    response = Net::HTTP.post_form(
      URI.parse("http://httpbin.org/post"),
      {"q" => "My query", "per_page" => "50"}
    )
    render json: response.body
  end

  def put
    uri = URI('http://httpbin.org/put')
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Put.new(
      uri.path,
      {'Content-Type' =>'application/json'}
    )
    req.body = { name: 'John Doe', role: 'agent' }.to_json
    res = http.request(req)
    render json: res.body
  end
end
