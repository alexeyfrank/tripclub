# == Schema Information
#
# Table name: travel_ideas
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :string(255)
#  travel_category_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#  introtext          :text
#  preview_img        :string(255)
#

class TravelIdea < ActiveRecord::Base
  belongs_to :travel_category

  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  mount_uploader :preview_img, TravelIdeaPreviewImgUploader

  def to_s
    title
  end

  include TravelIdeaRepository
end
