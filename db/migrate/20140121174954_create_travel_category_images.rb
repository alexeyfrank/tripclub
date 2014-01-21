class CreateTravelCategoryImages < ActiveRecord::Migration
  def change
    create_table :travel_category_images do |t|
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
