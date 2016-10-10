require_relative '../spec_helper'

RSpec.describe "resolution" do
  it "adds resolutions to database" do
    Resolution.create(resolution_width: "1920", resolution_height: "1280")

    expect(Resolution.last.resolution_height).to eq("1280")
  end

  it "is invalid without resolution_width" do
    resolution = Resolution.new(resolution_height: "1280")

    expect(resolution).to_not be_valid
  end

  it "is invalid without resolution_height" do
    resolution = Resolution.new(resolution_width: "1920")

    expect(resolution).to_not be_valid
  end

end
