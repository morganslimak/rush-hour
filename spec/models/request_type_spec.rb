require_relative '../spec_helper'

RSpec.describe "request_type" do
  describe "add requests" do
    it "adds request_type to database" do
      RequestType.create(request_type: "GET")

      expect(RequestType.last.request_type).to eq("GET")
    end

    it "is invalid without request_type" do
      request_type = RequestType.new

      expect(request_type).to_not be_valid
    end
  end

  describe ".most_frequent_request" do
    it "returns the most frequent request type" do
      get = RequestType.create(request_type: "GET")
      post = RequestType.create(request_type: "POST")

      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":get.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":post.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":post.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(RequestType.most_frequent_request).to eq("POST")
    end
  end

  describe ".http_verbs" do
    it "lists all unique http verbs" do
      get = RequestType.create(request_type: "GET")
      post = RequestType.create(request_type: "POST")
      put = RequestType.create(request_type: "PUT")

      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":get.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":post.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":post.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":put.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(RequestType.http_verbs).to eq(["GET", "POST", "PUT"])
    end
  end

end
