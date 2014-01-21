# == Schema Information
#
# Table name: travel_categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TravelCategory < ActiveRecord::Base
  has_many :travel_ideas
  has_many :images, dependent: :destroy


  accepts_nested_attributes_for :images, allow_destroy: true

  def to_s
    title
  end
end
