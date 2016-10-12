class Url < ActiveRecord::Base
  validates :url, presence: true
  has_many :payloads

  def self.most_to_least_requested
    grouped = Payload.group(:url).count
    sorted = grouped.sort_by{|k, v| v}.reverse
    sorted.map{|obj| obj.first.url}
  end

  def max_response_time
    payloads.maximum(:responded_in)
  end

  def min_response_time
    payloads.minimum(:responded_in)
  end
end
