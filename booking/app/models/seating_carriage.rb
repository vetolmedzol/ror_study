# frozen_string_literal: true

class SeatingCarriage < Carriage
  validates :lower_seats, presence: true
end
