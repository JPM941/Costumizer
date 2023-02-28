require "open-uri"
require "nokogiri"
require "json"

@n ||= 0

url = "https://www.google.com/search?q=vetements+bizarres"

html_file = URI.open(url)
p html_doc = Nokogiri::HTML.parse(html_file)
puts "                                            search                                            "
p doc = html_doc.search('#vplap0')
