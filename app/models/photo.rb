class Photo < ActiveRecord::Base
  attr_accessible :name, :url, :link_url, :original_id
end
