require_relative '../lib/data_cryptocurrencies'

describe "cryptos_data" do
  let (:result) {cryptos_data("https://coinmarketcap.com/all/views/all/")}
  it "should not return nil" do
    expect(result).not_to be_nil
  end
  it "should return an array of hash" do
    expect(result).to be_a(Array)
  end
  it "should return at least 20 cryptos data" do
    expect(result.length).to be >= 20
  end
end