# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  menu_id    :integer
#  position   :integer
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Menu::Item < ActiveRecord::Base
  has_ancestry

  belongs_to :menu

  def to_s
    title
  end
end
