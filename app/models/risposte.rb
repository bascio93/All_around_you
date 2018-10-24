class Risposte < ApplicationRecord
  belongs_to :user
  belongs_to :domande
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 250 }
end
