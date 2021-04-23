class AddPeopleNumToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :people_num, :integer
  end
end
