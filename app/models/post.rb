class Post < ActiveRecord::Base

  include PostRepository

  def to_s
    title
  end
end
