desc 'calc rates'

task rate: :environment do
  rates = Judge.rates

  puts "---- Overall Ranking ----"
  ranking = rates.sort_by {|photo, score| -score}
  rank = 1
  ranking.each do |photo, score|
    puts "[%d] %s %d" % [rank, photo.name, score]
    rank += 1 # TODO consider tie
  end
end
