# == Schema Information
#
# Table name: slides
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Slide < ActiveRecord::Base
  mount_uploader :image, SlideImageUploader
end
