class ReferredBy < ActiveRecord::Base
  validates :referred_by, presence: true
  has_many :payloads
  def self.table_name() "referred_bys" end
end
