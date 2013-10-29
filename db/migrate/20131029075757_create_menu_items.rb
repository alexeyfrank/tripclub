class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :url
      t.integer :menu_id
      t.integer :position
      t.string :ancestry

      t.timestamps
    end
  end
end
