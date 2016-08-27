class AddBooleanFieldsToEmailAddress < ActiveRecord::Migration
  def change
    add_column :email_addresses, :send_google_index_change, :boolean, default: true, null: false
    add_column :email_addresses, :send_backlink_change, :boolean, default: true, null: false
  end
end
