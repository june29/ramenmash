class Photo < ActiveRecord::Base
  attr_accessible :name, :url, :link_url, :original_id

  scope :exclude, lambda { |ids| where("id NOT IN (?)", ids) }

  def rate
    Judge.rate(self)
  end

  def rank
    Judge.rank(self)
  end
end
