module HouseRepository
  extend ActiveSupport::Concern

  included do
    scope :admin, -> { order(created_at: :desc) }
    scope :web, -> { order(created_at: :desc) }
    scope :last, ->(limit) { web.limit(limit) }
  end
end
