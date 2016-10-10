class RenameColumnInRequestTypes < ActiveRecord::Migration
  def change
    rename_column :request_types, :request_types, :request_type
  end
end
