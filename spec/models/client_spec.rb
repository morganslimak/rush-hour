require_relative '../spec_helper'

RSpec.describe "add client" do
  it "adds client to database" do
    Client.create(identifier: "client1", root_url: "http://client1.com")

    expect(Client.last.identifier).to eq("client1")
    expect(Client.last.root_url).to eq("http://client1.com")
  end

  it "is invalid without identifier" do
    client = Client.new(root_url: "http://client1.com")

    expect(client).to_not be_valid
  end

  it "is invalid without root_url" do
    client = Client.new(identifier: "client1")

    expect(client).to_not be_valid
  end
end
