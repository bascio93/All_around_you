class AddMediaVotiToDomandes < ActiveRecord::Migration[5.1]
  def change
    add_column :domandes, :media_voti, :integer
  end
end
