class RecreateThumbnailsHouseImage < ActiveRecord::Migration
  def change
    House::Image.find_each do |img|
      if img.file
        img.file.recreate_versions!
      end
    end
  end
end
