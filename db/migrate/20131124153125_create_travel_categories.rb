class CreateTravelCategories < ActiveRecord::Migration
  def change
    create_table :travel_categories do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
