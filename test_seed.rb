require "open-uri"
require "nokogiri"
require "json"

@n ||= 0

url = "https://www.google.com/search?q=vetements+bizarres"

html_file = URI.open(url)
html_doc = Nokogiri::HTML.parse(html_file)
puts "                                            search                                            "
html_doc.search("#vplap0").each do |element|

  puts element

end
