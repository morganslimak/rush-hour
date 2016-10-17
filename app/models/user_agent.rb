class UserAgent < ActiveRecord::Base
  validates :user_agent, presence: true
  has_many :payloads

  def self.list_browsers(payloads)
    grouped = payloads.group(:user_agent).count
    grouped.map do |k, v|
      parsed = UserAgentParser.parse k.user_agent
      [parsed.to_s, v]
    end.to_h
  end

  def self.list_os(payloads)
    grouped = payloads.group(:user_agent).count
    grouped.map do |k, v|
      parsed = UserAgentParser.parse k.user_agent
      [parsed.os.to_s, v]
    end.to_h
  end
end
