require 'nokogiri'
require 'open-uri'
require 'pry'

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def hash_crypto(truk)
	prix = truk.css("td.cmc-table__cell--sort-by__price//a").map{|prx| prx.text} # met dans un tableau les differents prix de cryptomonnais 
	titre = truk.css("td.cmc-table__cell--sort-by__name//a").map(&:text) #met dans un tableau les nom des differentes cryptomonais
	array_of_hash_crypto = []
	(prix.length).times do |v|#une bouche permetant d'incrmenter un hash et d'y entrer en "key" les noms des cryptomonnais et en "valeurs" les prix
		hash_crypto = {titre[v] => prix[v]}
		array_of_hash_crypto << hash_crypto #hash in array
	end
puts array_of_hash_crypto
end
hash_crypto(doc)