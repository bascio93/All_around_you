class AddDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :domandes, :mipiacecount, :integer, default: 0
    change_column :domandes, :nonmipiacecount, :integer, default: 0
  end
end
