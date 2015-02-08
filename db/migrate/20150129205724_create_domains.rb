class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string   :url
      t.integer  :g_index, default: 0, null: false
      t.datetime :checked_at

      t.timestamps null: false
    end
  end
end
