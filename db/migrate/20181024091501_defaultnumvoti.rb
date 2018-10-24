class Defaultnumvoti < ActiveRecord::Migration[5.1]
  def change
    change_column :domandes, :num_voti, :integer, default: 0
  end
end
