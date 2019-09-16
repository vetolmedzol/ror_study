# frozen_string_literal: true

class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
    if params[:first_railway_station_id] == params[:last_railway_station_id]
      @error = 'Can\'t be equal!'
    else
      @first_railway_station = RailwayStation.find(params[:first_railway_station_id])
      @last_railway_station = RailwayStation.find(params[:last_railway_station_id])
      @routes = @first_railway_station.routes && @last_railway_station.routes
    end
  end
end
