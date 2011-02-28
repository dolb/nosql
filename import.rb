require 'rubygems'
require 'couchrest'
require 'json'
require 'open-uri'
require 'net/http'
require 'rexml/document'

#baza = CouchRest.database!('http://sigma.ug.edu.pl:14015/test')
baza = CouchRest.database!('http://127.0.0.1:5984/test01')
begin
	json = JSON.parse(File.open(ARGV[0]).read)
rescue
	puts "padlo"
end
	

	
	baza.bulk_save(json)

