class Dropcolumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :domandes, :media_voti
  end
end
