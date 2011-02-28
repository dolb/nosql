require 'rubygems'
require 'couchrest'
require 'json'
require 'open-uri'
require 'net/http'
require 'rexml/document'


file=File.open(ARGV[0],"r")
	
counter=1
limit=3



result = ["["]
koniec = []


file.each_line do | line |
	if counter<limit
		counter = counter +1
		if counter!=limit 			
			line<<","
			puts counter
		elsif
			puts "dodaje"
		end
	result.push(line)
	end
end
  
file.close

result.push("]")

puts result

baza = CouchRest.database!('http://127.0.0.1:5984/test01')
begin
	json = JSON.parse(result)
rescue
	puts "padlo"
end
	
baza.bulk_save(json)

