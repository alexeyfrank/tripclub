# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  include EventRepository

  def to_s
    title
  end
end
