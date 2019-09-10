# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = %w[CoupeCarriage CVCarriage ReservedCarriage SeatingCarriage].freeze
  belongs_to :train
  validates :number, :type, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number

  def add_number
    self.number ||= max_number + 1
  end

  def max_number
    train.carriages.pluck(:number).max || 0
  end
end
