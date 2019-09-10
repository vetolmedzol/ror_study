# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true
  validates :number, format: /[a-z\d]{3}-?[a-z\d]{2}/i.freeze

  belongs_to :current_station, class_name: 'RailwayStation',
                               foreign_key: :current_railway_station_id
  belongs_to :route, class_name: 'Route',
                     foreign_key: :route_id
  has_many :tickets
  has_many :carriages, ->(train) { order("number #{train.order_carriage ? 'ASC' : 'DESC'}") }

  def seats_by_type(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end

  def self.order_carriage
    true
  end

  def count_cars(carriages, type)
    count = 0
    carriages.each do |car|
      count += 1 if car.type == type
    end
    count
  end

  def count_seats(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
