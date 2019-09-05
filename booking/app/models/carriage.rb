# frozen_string_literal: true

class Carriage < ApplicationRecord
  belongs_to :train
  validates :train, :type_of_car, :lower_seats, :top_seats, presence: true
end
