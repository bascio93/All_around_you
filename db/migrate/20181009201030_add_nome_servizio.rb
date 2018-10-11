class AddNomeServizio < ActiveRecord::Migration[5.1]
  def change
    add_column :servizi, :nome, :string
  end
end
