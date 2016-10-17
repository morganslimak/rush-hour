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

  describe ".list_browsers" do
    it "lists all browsers grouped by count" do
      uagent1 = UserAgent.create(user_agent: "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36")
      uagent2 = UserAgent.create(user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0")

      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent1.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent2.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent1.id,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expected = {"Firefox 48.0"=>1, "Chrome 53.0.2785"=>2}
      expect(UserAgent.list_browsers(Payload.all)).to eq(expected)
    end
  end

  describe ".list_os" do
    it "lists all operating systems grouped by count" do
      uagent1 = UserAgent.create(user_agent: "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36")
      uagent2 = UserAgent.create(user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:48.0) Gecko/20100101 Firefox/48.0")

      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent1.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent2.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":uagent1.id,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expected = {"Mac OS X 10.11"=>1, "Windows 7"=>2}
      expect(UserAgent.list_os(Payload.all)).to eq(expected)
    end
  end

end
