# frozen_string_literal: true

class Verse < ApplicationRecord
  validates :need, :theme, :name, :content, presence: true
end
