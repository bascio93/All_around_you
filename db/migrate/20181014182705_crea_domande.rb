class CreaDomande < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :domandes, :servizis
  end
end
