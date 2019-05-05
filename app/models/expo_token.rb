class ExpoToken < ApplicationRecord
  validates :token, presence: true, uniqueness: true
end
