module RecentHouseWidget
  extend ActiveSupport::Concern

  included do
    def recent_houses
      House.last(5)
    end
  end
end
