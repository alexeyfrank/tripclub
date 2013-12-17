# == Schema Information
#
# Table name: houses
#
#  id          :integer          not null, primary key
#  address     :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :house do
    address "MyString"
    description "MyText"
  end
end
