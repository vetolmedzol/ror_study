# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets

  scope :ordered, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.position').uniq
  }

  # scope :ordered, -> { select('railway_stations.*, railway_stations_routes.position').joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  scope :departure, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.departure').uniq
  }
  scope :arrival, lambda {
    joins(:railway_stations_routes).order('railway_stations_routes.arrival').uniq
  }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time(route, arrival, departure)
    station_route = station_route(route)
    station_route&.update(arrival: arrival, departure: departure)
  end

  def time(route, type_time)
    station_route(route).try(type_time)
    time = station_route(route).try(type_time)
    time&.strftime('%H:%M')
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
