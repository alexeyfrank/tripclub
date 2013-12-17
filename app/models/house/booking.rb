# == Schema Information
#
# Table name: house_bookings
#
#  id         :integer          not null, primary key
#  phone      :string(255)
#  content    :text
#  email      :string(255)
#  from       :date
#  to         :date
#  house_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class House::Booking < ActiveRecord::Base
  belongs_to :house
end
