class Defaultnonmipiace < ActiveRecord::Migration[5.1]
  def change
    change_column :domandes, :nonmipiacecount, :integer, default: 0
  end
end
