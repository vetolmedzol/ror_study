# frozen_string_literal: true

class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :station_count
  validates :name, presence: true

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  scope :ordered_railway_stations, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_index') }

  def stations_count
    if railway_stations.сount < 2
      errors.add(:base, 'Route must have minimum 2 station')
    end
  end
end
