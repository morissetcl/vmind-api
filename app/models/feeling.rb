class Feeling < ApplicationRecord
  validates_uniqueness_of :deviceId, conditions: { -> { where("DATE(created_at) = ?", Date.today) } }
end
