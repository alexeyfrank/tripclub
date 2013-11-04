class House::Image < ActiveRecord::Base
  belongs_to :house

  mount_uploader :file, HouseFileUploader
end
