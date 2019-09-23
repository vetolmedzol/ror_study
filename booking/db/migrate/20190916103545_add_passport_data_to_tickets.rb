# frozen_string_literal: true

class AddPassportDataToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :passport_data, :string
  end
end
