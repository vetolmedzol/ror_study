class DeleteTrainIdFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :train_id

  end
end
