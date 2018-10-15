class User < ApplicationRecord
  has_many :servizis, dependent: :destroy #lol
  has_many :recensionis, dependent: :destroy
  has_many :domandes, dependent: :destroy
  attr_accessor :remember_token, :reset_token
  before_save { self.email = email.downcase }
  before_create { create_activation_digest }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
   has_secure_password

   validates :password, length: { minimum: 6 }, allow_blank: true
 def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #Activation remember digest saved on db
  def create_activation_digest
    self.activation_token=User.nuovotoken
    self.activation_digest=User.digest(activation_token)
  end
  def feed
    Servizi.where("user_id = ?", id)
  end
  #Modifica reset password digest
  def create_reset_digest
    self.reset_token = User.nuovotoken
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  #Manda mail all'utente
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now!
  end
  #Cookie remember token
  def User.nuovotoken
      SecureRandom.urlsafe_base64
  end
  def remember
    self.remember_token = User.nuovotoken
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  def authenticated?(attribute,token)
      digest=self.send("#{attribute}_digest")
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
  end
  def forget
      update_attribute(:remember_digest, nil)
  end
  def paswscaduta?
    reset_sent_at < 2.hours.ago
  end
end
