class AddActivationToken < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :activation_token, :string
     add_index :users, :activation_token
  end
end
