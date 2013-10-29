# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :menu_item, :class => 'Menu::Item' do
    title "MyString"
    url "MyString"
    menu_id 1
    position 1
    ancestry "MyString"
  end
end
