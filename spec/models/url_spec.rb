require_relative '../spec_helper'

RSpec.describe "url" do
  describe "add url" do
    it "adds url to database" do
      Url.create(url: "http://jumpstartlab.com/blog")

      expect(Url.last.url).to eq("http://jumpstartlab.com/blog")
    end

    it "is invalid without url" do
      url = Url.new

      expect(url).to_not be_valid
    end
  end

  describe ".most_to_least_requested" do
    it "lists urls from most to least requested" do
      url1 = Url.create(url: "http://1.com")
      url2 = Url.create(url: "http://2.com")
      url3 = Url.create(url: "http://3.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url3.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(Url.most_to_least_requested).to eq([url2.url, url1.url, url3.url])
    end
  end

end
