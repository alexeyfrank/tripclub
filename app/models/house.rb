class House < ActiveRecord::Base
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  def to_s
    address
  end
  include HouseRepository
end
