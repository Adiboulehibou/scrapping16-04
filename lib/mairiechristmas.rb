require 'nokogiri'
require 'open-uri'
require 'pry'


def get_townhall_email(townhall_url)
  email_mairie = townhall_url.css("table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)").map(&:text)
  #puts email_mairie
end



doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

def get_townhall_urls(townhall_all_url)
  mairie_url = townhall_all_url.css("a.lientxt").map{ |link| link['href'] }
  mairie_name = townhall_all_url.css("a.lientxt").map(&:text)
  mairie_complete_url = []
  array_of_hash_town_and_url = []
  185.times do |v|
    mairie_complete_url[v] = "http://annuaire-des-mairies.com"+mairie_url[v][1..-1]
    u = Nokogiri::HTML(open(mairie_complete_url[v]))
    hash_town_and_url = { mairie_name[v] => get_townhall_email( u )}
    array_of_hash_town_and_url << hash_town_and_url
  end
  puts array_of_hash_town_and_url

end
get_townhall_urls(doc)
