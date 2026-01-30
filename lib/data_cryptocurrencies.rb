require 'nokogiri'
require 'open-uri'

cryptos_url = "https://coinmarketcap.com/all/views/all/"

def cryptos_data(cryptos_list)
  coin_page = Nokogiri::HTML(URI.open(cryptos_list))
  all_cryptoS_row = coin_page.xpath('//tr[@class="cmc-table-row"]')
  all_cryptos_array = []
  all_cryptoS_row.each do |row|
    cryptos_name = row.xpath('td[contains(@class, "symbol")]').text
    
    cryptos_price = row.xpath('td[contains(@class, "price")]').text.delete("$,").to_f
    
    all_cryptos_array<< {cryptos_name => cryptos_price}
  end
  return all_cryptos_array
end
  puts "all cryptos data: "
  puts cryptos_data(cryptos_url)

# array results limited to 20
# if we wanted to extract all elements listed, we'll use gem 'Watir' instead
# because 'Nokogiri' only read static HTML and NOT javascript script loaded after, displaying more elements, etc.