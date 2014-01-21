class TravelCategory::Image < ActiveRecord::Base
  belongs_to :travel_category

  validates :file, presence: true

  mount_uploader :file, TravelCategoryImageUploader
end
