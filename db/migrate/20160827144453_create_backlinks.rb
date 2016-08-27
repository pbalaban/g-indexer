class CreateBacklinks < ActiveRecord::Migration
  def change
    create_table :backlinks do |t|
      t.string   :referrer_page
      t.string   :referent_domain
      t.boolean  :active, default: false, null: false
      t.datetime :checked_at

      t.timestamps null: false
    end
  end
end
