class AddTimestampsColumnToPayloads < ActiveRecord::Migration
  def change
    add_column :payloads, :created_at, :datetime, null: false
    add_column :payloads, :updated_at, :datetime, null: false
  end
end
