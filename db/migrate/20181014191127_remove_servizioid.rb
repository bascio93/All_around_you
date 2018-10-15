class RemoveServizioid < ActiveRecord::Migration[5.1]
  def change
    remove_column :domandes, :servizio_id
  end
end
