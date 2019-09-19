# frozen_string_literal: true

class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.integer :top_seats
      t.integer :lower_seats
      t.integer :side_top_seats
      t.integer :side_lower_seats
      t.string :type

      t.belongs_to :train
      t.timestamps
    end
  end
end
