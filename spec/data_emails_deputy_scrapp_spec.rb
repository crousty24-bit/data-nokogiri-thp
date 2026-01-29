require_relative '../lib/data_emails_deputy'

describe "perform" do
  let(:result) {perform}
  it "should not return nil" do
    expect(result).not_to be_nil
  end
  it "should return an array of hash" do
    expect(result).to be_a(Array)
  end
  it "should contain at least 5 deputy" do
    expect(result.length).to be > 5
  end
  it "should be a hash with the correct keys" do
    first_deputy = result.first
    expect(first_deputy).to have_key("first_name")
    expect(first_deputy).to have_key("last_name")
    expect(first_deputy).to have_key("email")
  end
end