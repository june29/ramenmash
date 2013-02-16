class Judge < ActiveRecord::Base
  attr_accessible :winner_id, :loser_id

  belongs_to :winner, :class_name => :Photo
  belongs_to :loser, :class_name => :Photo
end
