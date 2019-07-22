# coding: utf-8

require 'net/http'
require 'uri'

client_cd = "c_7770023774"

url = URI.parse("https://wwwtst.k6.zexy.net/wedding/#{client_cd}/kuchikomi/")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
res = http.start {
  http.get(url.path)
}

puts res.code
puts res.body
