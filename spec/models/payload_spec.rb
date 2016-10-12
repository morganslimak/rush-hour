require_relative '../spec_helper'

RSpec.describe "payload" do
  describe "add payload" do
    it "adds payload to database" do
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":37,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(Payload.last.responded_in).to eq(37)
    end

    it "is invalid without a url_id" do
      payload = Payload.new({"requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without requested_at" do
      payload = Payload.new({"url_id":1,
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without responded_in" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without referred_by_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without request_type_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without event_name_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without user_agent_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "resolution_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without resolution_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "ip_id":1
                           })

      expect(payload).to_not be_valid
    end

    it "is invalid without ip_id" do
      payload = Payload.new({"url_id":1,
                             "requested_at":"2013-02-16 21:38:28 -0700",
                             "responded_in":37,
                             "referred_by_id":1,
                             "request_type_id":1,
                             "event_name_id":1,
                             "user_agent_id":1,
                             "resolution_id":1,
                           })

      expect(payload).to_not be_valid
    end
  end

  describe ".average_reponse_time" do
    it "returns average response time" do
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(Payload.average_response_time).to eq(30)
    end
  end

  describe ".max_reponse_time" do
    it "returns maximum response time" do
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":2,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(Payload.max_response_time).to eq(40)
    end
  end

  describe ".min_reponse_time" do
    it "returns minimum response time" do
      Payload.create({"url_id":1,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":2,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(Payload.min_response_time).to eq(20)
    end
  end

end
