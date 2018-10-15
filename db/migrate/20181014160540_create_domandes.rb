class CreateDomandes < ActiveRecord::Migration[5.1]
  def change
    create_table :domandes do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :servizi, foreign_key: true

      t.timestamps
    end
  end
end
