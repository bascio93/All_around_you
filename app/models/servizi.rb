class Servizi < ApplicationRecord
  belongs_to :user
  has_many :recensionis, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :immagini, ImmaginiUploader
  validates :user_id, presence: true
  validates :descrizione, length: { maximum: 300 }
  validate  :limite_immagine

  private
  def limite_immagine
    if immagini.size > 5.megabytes
       errors.add(:immagini, "Immagine troppo grande")
    end

  end
end
