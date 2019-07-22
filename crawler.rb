# coding: utf-8

require 'net/http'
require 'uri'
require 'nokogiri'
require "csv"

client_cd = ARGV[0] || "c_7770023774"
output_filename = ARGV[1] || "kuchikomi.csv"

url = URI.parse("https://wwwtst.k6.zexy.net/wedding/#{client_cd}/kuchikomi/")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
res = http.start {
  http.get(url.path)
}

kuchikomi_list = []

doc = Nokogiri::HTML.parse(res.body)
doc.css(".kuchikomiDetail__list").each {|e|
  heading = e.css(".kuchikomiDetail__listMiddle__heading").text.strip
  impression = e.css(".kuchikomiDetail__listMiddle__impression__txt").text.strip
  link_url = e.css(".kuchikomiDetail__listMiddle__heading a").attribute("href")
  satisfaction = $1.to_f if /([0-9.]+)/ =~ e.css(".kuchikomiDetail__listTop__satisfaction").text
  price = $1.to_i if /([0-9]+)/ =~ e.css(".kuchikomiDetail__listTop__price").text
  date = e.css(".kuchikomiDetail__listMiddle__bottomLeft").text.strip
  profile = e.css(".kuchikomiDetail__listMiddle__bottomRight").text.strip

  kuchikomi = {}
  kuchikomi[:heading] = heading
  kuchikomi[:impression] = impression
  kuchikomi[:link_url] = link_url
  kuchikomi[:satisfaction] = satisfaction
  kuchikomi[:price] = price
  kuchikomi[:date] = date
  kuchikomi[:profile] = profile

  kuchikomi_list << kuchikomi
}

CSV.open(output_filename ,"w", encoding:"cp932") {|rows|
  rows << [
    "heading",
    "impression",
    "link_url",
    "satisfaction",
    "price",
    "date",
    "profile",
  ]
  
  kuchikomi_list.each {|kuchikomi|
    rows << [
      kuchikomi[:heading],
      kuchikomi[:impression],
      kuchikomi[:link_url],
      kuchikomi[:satisfaction],
      kuchikomi[:price],
      kuchikomi[:date],
      kuchikomi[:profile],
    ]
  }
}
