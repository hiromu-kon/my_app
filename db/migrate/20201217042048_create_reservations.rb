class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
