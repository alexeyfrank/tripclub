class TravelIdea < ActiveRecord::Base
  belongs_to :travel_category

  mount_uploader :preview_img, TravelIdeaPreviewImgUploader

  def to_s
    title
  end

  include TravelIdeaRepository
end
