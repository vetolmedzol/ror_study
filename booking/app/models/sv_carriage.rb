# frozen_string_literal: true

class SVCarriage < Carriage
  validates :lower_seats, presence: true
  # validates :side_lower_seats.nil?, presence: true
end
