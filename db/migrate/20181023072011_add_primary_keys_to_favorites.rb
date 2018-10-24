class AddPrimaryKeysToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_index :favorites, [:user_id, :servizi_id], unique: true
  end
end
