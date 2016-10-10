require_relative '../spec_helper'

RSpec.describe "event_name" do
  it "adds event_name to database" do
    EventName.create(event_name: "socialLogin")

    expect(EventName.last.event_name).to eq("socialLogin")
  end

  it "is invalid without event_name" do
    event = EventName.new

    expect(event).to_not be_valid
  end

end
