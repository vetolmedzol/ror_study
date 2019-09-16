# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :number
      t.belongs_to :train
      t.belongs_to :railway_station
      t.belongs_to :user
      t.timestamps
    end
  end
end
