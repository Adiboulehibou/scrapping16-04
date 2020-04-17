require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# def array_of_hash_crypto[(hash_crypto)]
#   return array_of_hash_crypto << hash_crypto
# end

def hash_crypto(truk)
	#print truk
	prix = truk.css("td.cmc-table__cell--sort-by__price//a").map{|prx| prx.text} 
	titre = truk.css("td.cmc-table__cell--sort-by__name//a").map(&:text) 
	array_of_hash_crypto = []
	(prix.length).times do |v|
		hash_crypto = {titre[v] => prix[v]}
		array_of_hash_crypto << hash_crypto 
	end
puts array_of_hash_crypto
end
hash_crypto(doc)