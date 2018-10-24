class Add2 < ActiveRecord::Migration[5.1]
  def change
    add_column :domandes, :nolikecount, :integer, default: 0
  end
end
