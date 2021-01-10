# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true
end
