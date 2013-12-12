class Slide < ActiveRecord::Base
  mount_uploader :image, SlideImageUploader
end
