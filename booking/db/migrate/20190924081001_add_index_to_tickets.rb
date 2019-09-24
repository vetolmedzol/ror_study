class AddIndexToTickets < ActiveRecord::Migration[5.2]
  def change
    add_index :tickets, :user_id
  end
end
