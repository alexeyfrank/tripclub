class TravelCategory < ActiveRecord::Base
  has_many :travel_ideas

  def to_s
    title
  end
end
