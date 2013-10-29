module PageRepository
  extend ActiveSupport::Concern

  included do
    scope :admin, -> { order(created_at: :desc) }
  end
end
