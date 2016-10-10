class ChangeColumnNameInPayloads < ActiveRecord::Migration
  def change
    add_column :payloads, :url_id, :integer
    add_column :payloads, :referred_by_id, :integer
    add_column :payloads, :request_type_id, :integer
    add_column :payloads, :resolution_id, :integer
    add_column :payloads, :event_name_id, :integer
    add_column :payloads, :ip_id, :integer
    add_column :payloads, :user_agent_id, :integer

    remove_column :payloads, :resolution_height
    remove_column :payloads, :resolution_width
    remove_column :payloads, :url
    remove_column :payloads, :referred_by
    remove_column :payloads, :request_type
    remove_column :payloads, :event_name
    remove_column :payloads, :ip
    remove_column :payloads, :user_agent

  end
end
