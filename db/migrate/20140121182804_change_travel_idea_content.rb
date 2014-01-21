class ChangeTravelIdeaContent < ActiveRecord::Migration
  def change
    change_column :travel_ideas, :content, :text
  end
end
