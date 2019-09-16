# frozen_string_literal: true

class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :stations_count
  validates :name, presence: true

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  scope :ordered_railway_stations, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.position')
  }

  scope :departure_railway_stations, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.departure')
  }

  scope :arrival_railway_stations, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.arrival')
  }

  def stations_count
    if railway_station_ids.count < 2
      errors.add(:base, 'Route must have minimum 2 station')
    end
  end
end
