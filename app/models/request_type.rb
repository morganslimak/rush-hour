class RequestType < ActiveRecord::Base
  validates :request_type, presence: true
  has_many :payloads

  def self.most_frequent_request
    grouped = Payload.group(:request_type).count
    grouped.max_by{|k, v| v}.first.request_type
  end

  def self.http_verbs
    pluck(:request_type)
  end
end
