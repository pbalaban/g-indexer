class AddExpiredAtToBacklinks < ActiveRecord::Migration
  def change
    add_column :backlinks, :expired_at, :datetime
  end
end
