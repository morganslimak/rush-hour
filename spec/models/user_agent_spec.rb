require_relative '../spec_helper'

RSpec.describe "user_agent" do
  it "adds user_agent to database" do
    UserAgent.create(user_agent: "Mozilla/5.0 (Macintosh")

    expect(UserAgent.last.user_agent).to eq("Mozilla/5.0 (Macintosh")
  end

  it "is invalid without user_agent" do
    user_agent = UserAgent.new

    expect(user_agent).to_not be_valid
  end

end
