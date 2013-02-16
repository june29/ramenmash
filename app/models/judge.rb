class Judge < ActiveRecord::Base
  attr_accessible :winner_id, :loser_id

  belongs_to :winner, :class_name => :Photo
  belongs_to :loser, :class_name => :Photo

  class << self
    INITIAL_RATE = 1500
    K = 32

    def rates
      rates = {}
      Photo.all.each do |photo|
        rates[photo] = INITIAL_RATE
      end

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

    def ranking
      sorted = rates.sort_by {|photo, rate| -rate}
      rank = 0
      last_rate = nil
      ranking = []
      sorted.each_with_index do |(photo, rate), index|
        if rate != last_rate
          rank = index + 1
        end
        ranking << {
          rank: rank,
          photo: photo,
          rate: rate
        }
        last_rate = rate
      end
      ranking
    end

    def rate(photo)
      rates[photo]
    end

    def rank(photo)
      ranking.select {|entry|
        entry[:photo] == photo
      }.first[:rank]
    end
  end
end
