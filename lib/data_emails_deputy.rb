require 'nokogiri'
require 'open-uri'

deputy_list_url = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"

def get_deputy_urls(all_urls)
  page = Nokogiri::HTML(URI.open(all_urls))
  deputy_links = page.xpath('//*[@id="deputes-list"]//a[@href]') # '*' all tags ; add 'a' cause we want href links

  urls_array = []

  deputy_links.each do |link|
    full_url = "https://www2.assemblee-nationale.fr" + link['href'] # rebuild full url cause 'relative link' in page.xpath
    urls_array<< full_url
  end
  return urls_array
end

#puts "number of deputy found: #{get_deputy_urls(deputy_list_url).length}"
#puts "example of url: #{get_deputy_urls(deputy_list_url).first}"

deputy_test_url = "https://www.assemblee-nationale.fr/dyn/deputes/PA408578" #Jean-Didier Berger

def get_deputy_data(deputy_url)
  page = Nokogiri::HTML(URI.open(deputy_url))
  all_email_links = page.xpath('//a[contains(@href, "mailto")]')
  email_element = all_email_links.find do |link|
    href_value = link['href']
    href_value.include?("@")
  end
  if email_element.nil? then return nil end
  final_email = email_element['href'].delete_prefix("mailto:")

  full_name = page.xpath('//h1').text.strip # get fullname in H1
  clean_name = full_name.gsub("M. ", "").gsub("Mme ", "") # clean remove M & Mme
  name_parts = clean_name.split(" ") # split into parts between spaces
  first_name = name_parts[0]
  last_name = name_parts[1..-1].join(" ") # everything past [0] is the last name
  
  return {
    "first_name" => first_name,
    "last_name" => last_name,
    "email" => final_email
  }
rescue => e 
  return nil # case if any error happen in the page
end

#puts "email of specific deputy : #{get_deputy_email(deputy_test_url)}"

def perform
  #puts "Retreiving list of all deputy ..."
  index_url = "https://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
  urls = get_deputy_urls(index_url)
  subset_urls = urls.first(10)
  
  #puts "Found #{subset_urls.length} deputy to scan. Starting now ..."

  final_array = []

  subset_urls.each do |url|
    data = get_deputy_data(url)
    if data
      final_array << data
      #puts "Scrapped: #{data['first_name']} #{data['last_name']} | #{data['email']}"
    end
  end
  #puts "-----------------------------"
  #puts "Done ! Here's the final result :"
  return final_array
end

if __FILE__ == $0
  puts perform
end

# if file is the main file executed -> run perform. Otherwise (if rspec), dont do anything.