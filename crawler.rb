# coding: utf-8

require 'net/http'
require 'uri'
require 'nokogiri'

client_cd = "c_7770023774"

url = URI.parse("https://wwwtst.k6.zexy.net/wedding/#{client_cd}/kuchikomi/")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
res = http.start {
  http.get(url.path)
}

doc = Nokogiri::HTML.parse(res.body)
doc.css(".kuchikomiDetail__listMiddle__impression__txt").each {|e|
  puts e.text
}
