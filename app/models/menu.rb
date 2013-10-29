# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Menu < ActiveRecord::Base
  has_many :items
end
