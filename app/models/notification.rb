class Notification < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :expo_token, presence: true
end
