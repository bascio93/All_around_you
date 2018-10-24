class Remove1 < ActiveRecord::Migration[5.1]
  def change
    remove_column :domandes, :mipiacecount
  end
end
