# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel_category_image, :class => 'TravelCategory::Image' do
    title "MyString"
    file "MyString"
  end
end
