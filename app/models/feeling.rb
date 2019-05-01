# frozen_string_literal: true

class Feeling < ApplicationRecord
  validates :mood, presence: true
  validates :deviceId, presence: true
end
