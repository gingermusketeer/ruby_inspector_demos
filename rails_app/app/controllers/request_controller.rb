require 'open-uri'

class RequestController < ApplicationController
  def get
    example_com_html = open('http://example.com?param=value').read
    render html: example_com_html.html_safe
  end
end
