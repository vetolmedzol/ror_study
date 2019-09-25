class AddUserNameToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :user_name, :string
  end
end
