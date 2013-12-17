# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  menu_id    :integer
#  position   :integer
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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
