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

  describe ".url_max_response_time" do
    it "returns max response time for specific url" do
      url1 = Url.create(url: "http://url1.com")
      url2 = Url.create(url: "http://url2.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":50,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(url1.max_response_time).to eq(40)
      expect(url2.max_response_time).to eq(50)
    end
  end

  describe ".url_min_response_time" do
    it "returns min response time for specific url" do
      url1 = Url.create(url: "http://url1.com")
      url2 = Url.create(url: "http://url2.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":50,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(url1.min_response_time).to eq(20)
      expect(url2.min_response_time).to eq(50)
    end
  end

  describe ".list_response_times" do
    it "lists response times for specific url from greatest to least" do
      url1 = Url.create(url: "http://url1.com")
      url2 = Url.create(url: "http://url2.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":30,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":35,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(url1.list_response_times).to eq([40, 30, 20])
      expect(url2.list_response_times).to eq([35])
    end
  end

  describe ".average_response_time" do
    it "returns average response time for specific url" do
      url1 = Url.create(url: "http://url1.com")
      url2 = Url.create(url: "http://url2.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(url1.average_response_time).to eq(30)
    end
  end

  describe ".http_verbs" do
    it "lists http verbs for specific url" do
      url1 = Url.create(url: "http://url1.com")
      url2 = Url.create(url: "http://url2.com")
      get = RequestType.create(request_type: "GET")
      post = RequestType.create(request_type: "POST")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":get.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":post.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url2.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":get.id,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })

      expect(url1.http_verbs).to eq(["GET", "POST"])
      expect(url2.http_verbs).to eq(["GET"])
    end
  end

  describe ".referrers" do
    it "lists 3 most popular referrers for url" do
      url1 = Url.create(url: "http://url1.com")
      ref1 = ReferredBy.create(referred_by: "http://ref1.com")
      ref2 = ReferredBy.create(referred_by: "http://ref2.com")
      ref3 = ReferredBy.create(referred_by: "http://ref3.com")
      ref4 = ReferredBy.create(referred_by: "http://ref4.com")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":ref4.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":ref1.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":ref1.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":ref2.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":ref2.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":ref3.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":ref4.id,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":1,
                      "resolution_id":1,
                      "ip_id":1
                    })
      expected = [ref4.referred_by, ref1.referred_by, ref2.referred_by]
      expect(url1.referrers).to match_array(expected)
    end
  end

  describe ".user_agents" do
    it "lists 3 most popular user agents for url" do
      url1 = Url.create(url: "http://url1.com")
      ua1 = UserAgent.create(user_agent: "ua1")
      ua2 = UserAgent.create(user_agent: "ua2")
      ua3 = UserAgent.create(user_agent: "ua3")
      ua4 = UserAgent.create(user_agent: "ua4")

      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":20,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua4.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua3.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua2.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua1.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":40,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua4.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua3.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      Payload.create({"url_id":url1.id,
                      "requested_at":"2013-02-16 21:38:28 -0700",
                      "responded_in":100,
                      "referred_by_id":1,
                      "request_type_id":1,
                      "event_name_id":1,
                      "user_agent_id":ua2.id,
                      "resolution_id":1,
                      "ip_id":1
                    })
      expected = [ua3.user_agent, ua4.user_agent, ua2.user_agent]
      expect(url1.agents).to match_array(expected)
    end
  end


end
