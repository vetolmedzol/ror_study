# frozen_string_literal: true

class CoupeCarriage < Carriage
  validates :lower_seats, :top_seats, presence: true
end
