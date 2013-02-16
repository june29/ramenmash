class Photo < ActiveRecord::Base
  attr_accessible :name, :url, :link_url, :original_id

  def rate
    Judge.rate(self)
  end
end
