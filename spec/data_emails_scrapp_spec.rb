require_relative '../lib/data_emails'

describe "get_townhall_email" do
  let (:result) {get_townhall_email("https://lannuaire.service-public.gouv.fr/ile-de-france/val-d-oise/c23327b7-7798-43a7-9316-569727c7e278")}
  it "should not return nil" do
    expect(result).not_to be_nil
  end
end

describe "get_townhall_urls" do
  let (:result) {get_townhall_urls("https://lannuaire.service-public.gouv.fr/navigation/ile-de-france/val-d-oise/mairie")}
  it "should not return nil" do
    expect(result).not_to be_nil
  end
  it "should return an array" do
    expect(result).to be_a(Array)
  end
end

describe "perform" do
  let (:result) {perform}
  it "should not return nil" do
    expect(result).not_to be_nil
  end
  it "should return an array of hash" do
    expect(result).to be_a(Array)
  end
  it "should contain at least 20 townhall emails" do
    expect(result.length).to be >= 20
  end
end