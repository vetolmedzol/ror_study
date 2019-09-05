# frozen_string_literal: true

class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.string :type_of_car
      t.integer :top_seats
      t.integer :lower_seats
      t.belongs_to :train
      t.timestamps
    end
  end
end
