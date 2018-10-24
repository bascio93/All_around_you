class Domande < ApplicationRecord
  attr_accessor :servizi_id # :vote_count, :likecount, :nolikecount
  belongs_to :user
  belongs_to :servizi
  has_many :rispostes
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 250 }
end
