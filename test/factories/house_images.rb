# == Schema Information
#
# Table name: house_images
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  file       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  house_id   :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house_image, :class => 'House::Image' do
    title "MyString"
    file "MyString"
  end
end
