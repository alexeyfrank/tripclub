class AddTravelCategoryIdToImages < ActiveRecord::Migration
  def change
    add_column :travel_category_images, :travel_category_id, :integer
  end
end
