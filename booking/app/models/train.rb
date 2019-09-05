# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true
  validates :number, format: /[a-z\d]{3}-?[a-z\d]{2}/i.freeze

  belongs_to :current_station, class_name: 'RailwayStation',
                               foreign_key: :current_railway_station_id
  belongs_to :route, class_name: 'Route',
                     foreign_key: :route_id
  has_many :tickets
  has_many :carriages

  def count_cars(cars, type)
    count = 0
    cars.each do |car|
      count += 1 if car.type_of_car == type
    end
    count
  end

  def count_seats(cars, seats_type, type)
    sum_lower_seats = 0
    sum_top_seats = 0
    cars.each do |car|
      sum_lower_seats += car.lower_seats if car.type_of_car == type
      sum_top_seats += car.top_seats if car.type_of_car == type
    end
    return sum_lower_seats if seats_type == 'lower_seats'
    return sum_top_seats if seats_type == 'top_seats'
  end
end
