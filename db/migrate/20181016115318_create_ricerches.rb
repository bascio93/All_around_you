class CreateRicerches < ActiveRecord::Migration[5.1]
  def change
    create_table :ricerches do |t|
      t.string :testonome
      t.string :testotipo
      t.timestamps
    end
  end
end
