# frozen_string_literal: true

class SVCarriage < Carriage
  validates :lower_seats, presence: true
end
