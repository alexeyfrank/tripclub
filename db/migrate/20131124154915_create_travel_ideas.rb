class CreateTravelIdeas < ActiveRecord::Migration
  def change
    create_table :travel_ideas do |t|
      t.string :title
      t.string :content
      t.integer :travel_category_id

      t.timestamps
    end
  end
end
