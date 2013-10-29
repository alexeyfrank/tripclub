module PostRepository
  extend ActiveSupport::Concern

  included do
    scope :desc, -> { order(created_at: :desc) }
  end
end
