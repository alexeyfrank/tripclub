class Event < ActiveRecord::Base
  include EventRepository

  def to_s
    title
  end
end
