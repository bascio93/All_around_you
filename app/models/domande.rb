class Domande < ApplicationRecord
  attr_accessor :servizi_id
  belongs_to :user
  belongs_to :servizi
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 250 }
end
