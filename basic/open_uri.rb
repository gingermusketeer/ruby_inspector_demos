require 'rubygems'
require 'bundler/setup'
require 'open-uri'
require 'ruby_inspector'
require 'pry'
RubyInspector.enable(
  'ruby inspector open uri demo',
  'demonstrates how to debug http requests like a boss'
)
binding.pry

puts 'opening example.com'

res = open('http://www.example.com')

puts "response size is: #{res.read.size}"

puts 'opening google.com'

res = open('http://www.google.com')

puts "response size is: #{res.read.size}"
