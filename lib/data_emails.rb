require 'nokogiri'
require 'open-uri'

avernes_url = "https://lannuaire.service-public.gouv.fr/ile-de-france/val-d-oise/c23327b7-7798-43a7-9316-569727c7e278"

def get_townhall_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  all_email_links = page.xpath('//a[contains(@href, "mailto")]')
  email_element = all_email_links.find do |link|
    href_value = link['href']
    href_value.include?("@") && !href_value.include?("subject=")
  end
  if email_element.nil? then return "email not found" end
  return email_element['href'].delete_prefix("mailto:")
end

puts "email of Avernes : #{get_townhall_email(avernes_url)}"

all_townhall_url = "https://lannuaire.service-public.gouv.fr/navigation/ile-de-france/val-d-oise/mairie"

def get_townhall_urls(all_urls)
  page = Nokogiri::HTML(URI.open(all_urls))
  town_links = page.xpath('//li[contains(@class, "result-item")]//a')

  urls_array = []

  town_links.each do |link| 
    urls_array<< link['href']
  end
  return urls_array
end

puts "number of townhall: #{get_townhall_urls(all_townhall_url).length}" 
puts "url found: #{get_townhall_urls(all_townhall_url)}"