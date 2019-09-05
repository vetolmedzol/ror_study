# frozen_string_literal: true

class Train < ApplicationRecord
  validates :number, presence: true
  validates :number, format: /[a-z\d]{3}-?[a-z\d]{2}/i.freeze

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_railway_station_id
  belongs_to :route, class_name: 'Route', foreign_key: :route_id
  has_many :tickets
end
