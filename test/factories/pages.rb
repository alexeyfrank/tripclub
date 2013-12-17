# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  slug       :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    content "MyText"
    ancestry "MyString"
  end
end
