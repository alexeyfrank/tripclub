class CreateHouseBookings < ActiveRecord::Migration
  def change
    create_table :house_bookings do |t|
      t.string :phone
      t.text :content
      t.string :email
      t.date :from
      t.date :to
      t.integer :house_id

      t.timestamps
    end
  end
end
