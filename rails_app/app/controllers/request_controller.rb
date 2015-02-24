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
end
