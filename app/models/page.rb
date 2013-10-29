class Page < ActiveRecord::Base
  has_ancestry


  include PageRepository
end
