class AddNumVotiToDomandes < ActiveRecord::Migration[5.1]
  def change
    add_column :domandes, :num_voti, :integer
  end
end
