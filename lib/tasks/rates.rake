desc 'calc rates'

task rates: :environment do
  puts "---- Overall Ranking ----"
  Judge.ranking.each do |entry|
    rank = entry[:rank]
    photo = entry[:photo]
    rate = entry[:rate]
    puts "[%d] %s %d" % [rank, photo.name, rate]
  end
end
