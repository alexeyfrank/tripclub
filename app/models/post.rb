# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  introtext  :text
#  preview    :string(255)
#

class Post < ActiveRecord::Base

  mount_uploader :preview, PostPreviewUploader

  include PostRepository

  def to_s
    title
  end
end
