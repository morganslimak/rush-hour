class Resolution < ActiveRecord::Base
  validates :resolution_width, :resolution_height, presence: true
  has_many :payloads

  def self.list_resolutions
    grouped = Payload.group(:resolution).count
    grouped.map do |k, v|
      [k.resolution_width + "x" + k.resolution_height, v]
    end.to_h
  end

end
