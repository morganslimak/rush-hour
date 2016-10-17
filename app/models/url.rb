class Url < ActiveRecord::Base
  validates :url, presence: true
  has_many :payloads
  has_many :request_types, through: :payloads
  has_many :referred_bys, through: :payloads
  has_many :user_agents, through: :payloads


  def self.most_to_least_requested(payloads)
    grouped = payloads.group(:url).count
    sorted = grouped.sort_by{|k, v| v}.reverse
    sorted.map{|obj| obj.first.url}
  end

  def max_response_time
    payloads.maximum("responded_in")
  end

  def min_response_time
    payloads.minimum("responded_in")
  end

  def list_response_times
    payloads.pluck("responded_in").sort.reverse
  end

  def average_response_time
    payloads.average("responded_in")
  end

  def http_verbs
    request_types.pluck("request_type")
  end

  def referrers
    grouped = referred_bys.group("referred_by").count
    sorted = grouped.sort_by{|url, count| count}.reverse
    sorted.map{|url, count| url }.slice(0,3)
  end

  def agents
    grouped = user_agents.group("user_agent").count
    sorted = grouped.sort_by{|ua, count| count}.reverse
    sorted.map{|ua, count| ua }.slice(0,3)
  end

end
