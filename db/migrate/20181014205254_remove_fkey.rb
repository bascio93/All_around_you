class RemoveFkey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :domandes, :servizio_id
  end
end
