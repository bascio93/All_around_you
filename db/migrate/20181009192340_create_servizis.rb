class CreateServizis < ActiveRecord::Migration[5.1]
  def change
    create_table :servizis do |t|
      t.text :descrizione
      t.references :user, index: true
      t.string :indirizzo
      t.string :tipo

      t.timestamps null: false
    end
    add_index :servizis, [:user_id, :created_at]
  end
end
