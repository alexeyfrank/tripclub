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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house_booking, :class => 'House::Booking' do
    phone "MyString"
    content "MyText"
    email "MyString"
    from "2013-11-16"
    to "2013-11-16"
    house_id 1
  end
end
