class CreateTravelIdeaImages < ActiveRecord::Migration
  def change
    create_table :travel_idea_images do |t|
      t.string :title
      t.string :file
      t.integer :travel_idea_id

      t.timestamps
    end
  end
end
