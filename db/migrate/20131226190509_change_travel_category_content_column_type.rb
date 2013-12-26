class ChangeTravelCategoryContentColumnType < ActiveRecord::Migration
  def change
    change_column :travel_categories, :content, :text
  end
end
