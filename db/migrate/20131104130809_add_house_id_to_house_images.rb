class AddHouseIdToHouseImages < ActiveRecord::Migration
  def change
    add_column :house_images, :house_id, :integer
  end
end
