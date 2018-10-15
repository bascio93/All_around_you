class AddServiziToDomandes < ActiveRecord::Migration[5.1]
  def change
    add_reference :domandes, :servizi, foreign_key: true
  end
end
