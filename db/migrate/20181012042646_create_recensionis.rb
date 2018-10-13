class CreateRecensionis < ActiveRecord::Migration[5.1]
  def change
    create_table :recensionis do |t|
      t.string :titolo
      t.text :content
      t.integer :votoservizio
      t.references :user, foreign_key: true
      t.references :servizi, foreign_key: true

      t.timestamps
    end
  end
end
