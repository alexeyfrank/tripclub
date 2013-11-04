class CreateHouseImages < ActiveRecord::Migration
  def change
    create_table :house_images do |t|
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
