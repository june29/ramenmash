desc 'calc dates'

task rate: :environment do
  INITIAL_RATE = 1500
  K = 32

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

    r_a_updated = r_a + delta_r
    r_b_updated = r_b - delta_r

    puts "Judge[%d]: win=%d, lose=%d" % [judge.id, a.id, b.id]
    puts "  A(%3d): %5d -> %5d" % [a.id, r_a, r_a_updated]
    puts "  B(%3d): %5d -> %5d" % [b.id, r_b, r_b_updated]

    rates[a] = r_a_updated
    rates[b] = r_b_updated
  end

  puts "---- Overall Ranking ----"
  ranking = rates.sort_by {|photo, score| -score}
  rank = 1
  ranking.each do |photo, score|
    puts "[%d] %s %d" % [rank, photo.name, score]
    rank += 1 # TODO consider tie
  end
end
