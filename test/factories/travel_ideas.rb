# == Schema Information
#
# Table name: travel_ideas
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :string(255)
#  travel_category_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#  introtext          :text
#  preview_img        :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel_idea do
    title "MyString"
    content "MyString"
    travel_category_id 1
  end
end
