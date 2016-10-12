class UserAgent < ActiveRecord::Base
  validates :user_agent, presence: true
  has_many :payloads
  attr_accessor :os, :browser

  def self.parse_browser(user_agent)
    parsed = UserAgentParser.parse user_agent
    @browser = parsed.to_s
  end

  def self.list_browsers
    grouped = Payload.group(:user_agent).count
    grouped.map do |k, v|
      parse_browser(k.user_agent)
      [@browser, v]
    end.to_h
  end

  def self.list_os
    grouped = Payload.group(:user_agent).count
    grouped.map do |k, v|
      user_agent = UserAgentParser.parse k.user_agent
      [user_agent.os.to_s, v]
    end.to_h
  end
end
