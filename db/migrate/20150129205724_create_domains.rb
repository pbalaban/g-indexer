class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string   :url
      t.boolean  :indexed, default: false, null: false
      t.datetime :checked_at

      t.timestamps null: false
    end
  end
end
