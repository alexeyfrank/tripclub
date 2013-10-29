class AddPageAncestyIndex < ActiveRecord::Migration
  def change
    add_index :pages, :ancestry
  end
end
