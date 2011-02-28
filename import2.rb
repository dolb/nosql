require 'rubygems'
require 'couchrest'
require 'json'

#baza = CouchRest.database!('http://sigma.ug.edu.pl:14015/test')
baza = CouchRest.database!('http://127.0.0.1:5984/test01')

file=File.open(ARGV[0],"r")
	
counter=0
limit=3

file.each_line do | line |
	json = JSON.parse(line)
	baza.save_doc(json)
end
	
puts "zapisano"	

