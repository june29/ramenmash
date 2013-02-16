class Judge < ActiveRecord::Base
  attr_accessible :winner_id, :loser_id

  belongs_to :winner, :class_name => :Photo
  belongs_to :loser, :class_name => :Photo

  class << self
    INITIAL_RATE = 1500
    K = 32

    def rates
      rates = Hash.new(INITIAL_RATE)

      Judge.order(:id).each do |judge|
        a = judge.winner
        b = judge.loser
        r_a = rates[a]
        r_b = rates[b]

        d = 16 + (r_b - r_a) * 0.04
        d = 1 if d < 1
        d = 31 if d > 31
        delta_r = d.round

        rates[a] = r_a + delta_r
        rates[b] = r_b - delta_r
      end

      rates
    end

    def rate(photo)
      rates[photo]
    end
  end
end
