# frozen_string_literal: true

class Ticket < ApplicationRecord
  validates :number, :passport_data, :user_name, presence: true

  belongs_to :train, class_name: 'Train', foreign_key: :train_id
  belongs_to :first_railway_station, class_name: 'RailwayStation',
                                     foreign_key: :first_railway_station_id

  belongs_to :last_railway_station, class_name: 'RailwayStation',
                                    foreign_key: :last_railway_station_id
  belongs_to :user

  after_create :send_notification
  after_destroy :send_destroyed

  def route_name
    "#{first_railway_station.title} - #{last_railway_station.title}"
  end

  private

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_destroyed
    TicketsMailer.delete_ticket(self.user, self).deliver_now
  end
end
