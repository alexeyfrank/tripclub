class TravelIdea::Image < ActiveRecord::Base
  belongs_to :travel_idea

  validates :file, presence: true

  mount_uploader :file, TravelIdeaImageUploader
end
