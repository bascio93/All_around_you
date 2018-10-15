class Favorite < ApplicationRecord
  attr_accessor :user_id, :servizi_id
  belongs_to :user
  belongs_to :servizi
  self.primary_keys = :servizi_id, :user_id
end
