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
doc.css(".kuchikomiDetail__list").each {|e|
  heading = e.css(".kuchikomiDetail__listMiddle__heading").text.strip
  impression = e.css(".kuchikomiDetail__listMiddle__impression__txt").text.strip
  link_url = e.css(".kuchikomiDetail__listMiddle__heading a").attribute("href")
  satisfaction = $1.to_f if /([0-9.]+)/ =~ e.css(".kuchikomiDetail__listTop__satisfaction").text
  price = $1.to_i if /([0-9]+)/ =~ e.css(".kuchikomiDetail__listTop__price").text
  date = e.css(".kuchikomiDetail__listMiddle__bottomLeft").text.strip
  profile = e.css(".kuchikomiDetail__listMiddle__bottomRight").text.strip

  puts "-- kuchikomiDetail"
  puts "heading: #{heading}"
  puts "impression: #{impression}"
  puts "link_url: #{link_url}"
  puts "satisfaction: #{satisfaction}"
  puts "price: #{price}"
  puts "date: #{date}"
  puts "profile: #{profile}"
}
