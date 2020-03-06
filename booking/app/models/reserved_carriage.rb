# frozen_string_literal: true

class ReservedCarriage < Carriage
  validates :lower_seats, :top_seats, :side_top_seats,
            :side_lower_seats, presence: true
end
