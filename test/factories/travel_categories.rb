# == Schema Information
#
# Table name: travel_categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel_category do
    title "MyString"
    content "MyString"
  end
end
