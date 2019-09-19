# frozen_string_literal: true

class AddUserIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :user_id, :integer
  end
end
