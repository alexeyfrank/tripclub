module RecentTravelIdeasWidget
  extend ActiveSupport::Concern

  included do
    def recent_travel_ideas
      TravelIdea.last(5)
    end
  end
end
