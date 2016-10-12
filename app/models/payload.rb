class Payload < ActiveRecord::Base
  validates :url_id, :requested_at, :responded_in, :referred_by_id,
            :request_type_id, :event_name_id, :user_agent_id, :resolution_id,
            :ip_id, presence: true

  belongs_to :url
  belongs_to :referred_by
  belongs_to :request_type
  belongs_to :event_name
  belongs_to :user_agent
  belongs_to :resolution
  belongs_to :ip

  def self.average_response_time
    average("responded_in")
  end

  def self.max_response_time
    maximum("responded_in")
  end

  def self.min_response_time
    minimum("responded_in")
  end

  def self.url_max_response_time(url)
    Payload.find_by url: url
  end

end
