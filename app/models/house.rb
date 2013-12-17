# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  address     :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class House < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :bookings, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  def to_s
    address
  end

  def preview_url
    img = images.first
    if img
      img.file_url
    else
      'default.jpg'
    end
  end
  include HouseRepository
end
