# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel_idea do
    title "MyString"
    content "MyString"
    travel_category_id 1
  end
end
