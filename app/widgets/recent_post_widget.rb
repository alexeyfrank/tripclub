module RecentPostWidget
  extend ActiveSupport::Concern

  included do
    def recent_posts
      Post.last(5)
    end
  end
end
