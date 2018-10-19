class Servizi < ApplicationRecord
  geocoded_by :indirizzo
  belongs_to :user
  before_save :creacoordinate
  has_many :favorites, dependent: :destroy
  has_many :recensionis, dependent: :destroy
  has_many :domandes, dependent: :destroy
  default_scope -> { order(created_at: :desc)
  }
  mount_uploader :immagini, ImmaginiUploader
  validates :user_id, presence: true
  validates :descrizione, length: { maximum: 300 }
  validate  :limite_immagine
  def creacoordinate
    lat=Geocoder.coordinates(self.indirizzo.split(',').first).first
    lon=Geocoder.coordinates(self.indirizzo.split(',').first).second
    self.latitude=lat
    self.longitude=lon
  end
  private
  def limite_immagine
    if immagini.size > 5.megabytes
       errors.add(:immagini, "Immagine troppo grande")
    end

  end
end
