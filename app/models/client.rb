class Client < ActiveRecord::Base
  validates :identifier, :root_url, presence: true
  has_many :payloads
  has_many :referred_bys,   through: :payloads
  has_many :request_types,  through: :payloads
  has_many :event_names,    through: :payloads
  has_many :user_agents,    through: :payloads
  has_many :resolutions,    through: :payloads
  has_many :ips,            through: :payloads
  has_many :urls,           through: :payloads
end
