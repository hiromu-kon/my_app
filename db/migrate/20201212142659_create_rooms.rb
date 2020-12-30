class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :content
      t.integer :cost
      t.string :address
      t.string :image
      t.integer :people
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
