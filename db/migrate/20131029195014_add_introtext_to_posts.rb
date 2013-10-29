class AddIntrotextToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :introtext, :text
  end
end
