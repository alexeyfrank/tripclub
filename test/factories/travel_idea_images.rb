# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travel_idea_image, :class => 'TravelIdea::Image' do
    title "MyString"
    file "MyString"
    travel_idea_id 1
  end
end
