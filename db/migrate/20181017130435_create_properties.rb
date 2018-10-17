class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
