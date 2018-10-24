class Remove3 < ActiveRecord::Migration[5.1]
  def change
    remove_column :domandes, :num_voti
  end
end
