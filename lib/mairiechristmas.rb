require 'nokogiri'
require 'open-uri'
require 'pry'






doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_email(townhall_url)#methode permetant de scapper les emails des mairie sur leurs pages web
  email_mairie = townhall_url.css("table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)").map(&:text)
  #puts email_mairie
end

def get_townhall_urls(townhall_all_url)#methode permettant d'associer les nom des ville avec l'email de contact
  mairie_url = townhall_all_url.css("a.lientxt").map{ |link| link['href'] }#met dans un tableau la fin des url de chaques site des mairis
  mairie_name = townhall_all_url.css("a.lientxt").map(&:text)#permet de recuperer le nom de chaque commune
  mairie_complete_url = []#initialisation d'un tableau pour stoker l'url complete des sites de chaque mairies
  array_of_hash_town_and_url = []#array of hash
  185.times do |v|#boucle increment 185 fois, soit le nombre de mairies dans le val d'oise
    mairie_complete_url[v] = "http://annuaire-des-mairies.com"+mairie_url[v][1..-1]#permet de stoker l'url complete des site de chaque mairis
    u = Nokogiri::HTML(open(mairie_complete_url[v]))#url des differente url complete des ville en fonction de "v"
    hash_town_and_url = { mairie_name[v] => get_townhall_email( u )}#creation du hash: "key"= nom de la mairis et v"aleurs"=email de contact de la mairis
    array_of_hash_town_and_url << hash_town_and_url#hash in array
  end
  puts array_of_hash_town_and_url

end
get_townhall_urls(doc)
