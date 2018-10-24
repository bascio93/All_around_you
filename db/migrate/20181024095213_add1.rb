class Add1 < ActiveRecord::Migration[5.1]
  def change
        add_column :domandes, :likecount, :integer, default: 0
  end
end
