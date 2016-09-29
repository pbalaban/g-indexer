class AddProjectIdToBacklinksAndDomains < ActiveRecord::Migration
  def change
    add_column :backlinks, :project_id, :integer
    add_column :domains, :project_id, :integer

    add_index :backlinks, :project_id
    add_index :domains, :project_id
  end
end
