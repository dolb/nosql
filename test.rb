require 'rubygems'
require 'couchrest'
require 'json'

file=File.open(ARGV[0],"r")
	
counter=1
limit=3

result = ["["]
result.push("");

file.each_line do | line |
	if counter<limit
		counter = counter +1
		if counter!=limit 			
			line<<","
		end
	result.push(line)
	end
end
  
file.close
result.push("")
result.push("]")

baza = CouchRest.database!('http://127.0.0.1:5984/test01')
begin
	json = JSON.parse(result.to_json)
rescue
	puts "padlo"
end
	
puts json

baza.bulk_save(json)

