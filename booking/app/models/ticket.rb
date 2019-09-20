# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :number, :passport_data, :user_name, presence: true

  belongs_to :train, class_name: 'Train', foreign_key: :current_train_id
  belongs_to :railway_station, class_name: 'RailwayStation',
                               foreign_key: :first_railway_station_id

  belongs_to :railway_station, class_name: 'RailwayStation',
                               foreign_key: :last_railway_station_id
  belongs_to :user
end
