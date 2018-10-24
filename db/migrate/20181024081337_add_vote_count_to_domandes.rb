class AddVoteCountToDomandes < ActiveRecord::Migration[5.1]
  def change
    add_column :domandes, :vote_count, :integer, default: 0
  end
end
