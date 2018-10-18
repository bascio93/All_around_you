class AddTestoIndirizzoToRicerche < ActiveRecord::Migration[5.1]
  def change
    add_column :ricerches, :testoindirizzo, :string
  end
end
