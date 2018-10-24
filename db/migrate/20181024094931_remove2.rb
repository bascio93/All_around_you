class Remove2 < ActiveRecord::Migration[5.1]
  def change
    remove_column :domandes, :nonmipiacecount
  end
end
