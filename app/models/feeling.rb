class Feeling < ApplicationRecord
  validates :deviceId, uniqueness: true
end
