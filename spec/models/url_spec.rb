require_relative '../spec_helper'

RSpec.describe "url" do
  it "adds url to database" do
    Url.create(url: "http://jumpstartlab.com/blog")

    expect(Url.last.url).to eq("http://jumpstartlab.com/blog")
  end

  it "is invalid without url" do
    url = Url.new

    expect(url).to_not be_valid
  end

end
