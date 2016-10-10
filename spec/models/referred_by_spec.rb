require_relative '../spec_helper'

RSpec.describe "referred_by" do
  it "adds referred_by to database" do
    ReferredBy.create(referred_by: "http://jumpstartlab.com")

    expect(ReferredBy.last.referred_by).to eq("http://jumpstartlab.com")
  end

  it "is invalid without referred_by" do
    referred_by = ReferredBy.new

    expect(referred_by).to_not be_valid
  end

end
