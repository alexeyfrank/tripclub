module TravelIdeaRepository
  extend ActiveSupport::Concern

  included do
    scope :desc, -> { order(created_at: :desc) }
    scope :last, ->(limit) { order(created_at: :desc).limit(limit) }
  end
end
