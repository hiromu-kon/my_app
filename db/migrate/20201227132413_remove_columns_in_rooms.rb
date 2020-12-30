class RemoveColumnsInRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :people, :integer
    remove_column :rooms, :start_date, :date
    remove_column :rooms, :finish_date, :date
  end
end
