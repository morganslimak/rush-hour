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

  describe ".list_resolutions" do
    it "lists all screen resolutions grouped by count" do
      res1 = Resolution.create(resolution_width: "1920",
                               resolution_height: "1080")
      res2 = Resolution.create(resolution_width: "320",
                               resolution_height: "568")

      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":res1.id,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":res1.id,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":res2.id,
                      "ip_id":1
                    })
      expected = {"1920x1080" => 2, "320x568" => 1}
      expect(Resolution.list_resolutions).to eq(expected)
    end
  end

end
