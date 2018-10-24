class Addrisp1 < ActiveRecord::Migration[5.1]
  def change
    add_column :rispostes, :vote_count, :integer, default: 0
    add_column :rispostes, :likecount, :integer, default: 0
    add_column :rispostes, :nolikecount, :integer, default: 0
  end
end
