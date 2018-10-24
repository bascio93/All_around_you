class Changename < ActiveRecord::Migration[5.1]
  def change
    add_column :domandes, :mipiacecount, :integer
    add_column :domandes, :nonmipiacecount, :integer
  end
end
