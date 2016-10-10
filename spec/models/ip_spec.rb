require_relative '../spec_helper'

RSpec.describe "ip" do
  it "adds ip to database" do
    Ip.create(ip: "63.29.38.211")

    expect(Ip.last.ip).to eq("63.29.38.211")
  end

  it "is invalid without ip" do
    ip = Ip.new

    expect(ip).to_not be_valid
  end

end
