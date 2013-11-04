class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
