class AddPictureToServizi < ActiveRecord::Migration[5.1]
  def change
    add_column :servizis, :immagini, :string
  end
end
