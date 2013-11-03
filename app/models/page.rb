# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

class Page < ActiveRecord::Base
  has_ancestry

  include PageRepository

  def to_s
    title
  end

  def to_param
    slug
  end
end
