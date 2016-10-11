class RequestType < ActiveRecord::Base
  validates :request_type, presence: true
  has_many :payloads

  def self.most_frequent_request
    group(:request_type).count.max_by{|k, v| v}.first
  end
end
