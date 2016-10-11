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
      RequestType.create(request_type: "GET")
      RequestType.create(request_type: "POST")
      RequestType.create(request_type: "POST")

      expect(RequestType.most_frequent_request).to eq("POST")
    end
  end

end
