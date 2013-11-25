class AddColumnsToTravelIdeas < ActiveRecord::Migration
  def change
    add_column :travel_ideas, :introtext, :text
    add_column :travel_ideas, :preview_img, :string
  end
end
