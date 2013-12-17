# == Schema Information
#
# Table name: house_images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  file       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  house_id   :integer
#

class House::Image < ActiveRecord::Base
  belongs_to :house

  validates :file, presence: true

  mount_uploader :file, HouseFileUploader
end
