# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house_image, :class => 'House::Image' do
    title "MyString"
    file "MyString"
  end
end
