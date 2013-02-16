require 'open-uri'

desc 'Import master data'
task import: :environment do
  api_key = ENV['RECRUIT_WEBSERVICE_API_KEY']
  if api_key.blank?
    raise 'RECRUIT_WEBSERVICE_API_KEY is not set'
  end
  start = 1
  count = 100
  service_area = 'SA41' # 北海道
  food_id = 'R038' # ラーメン

  loop do
    url = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{api_key}&service_area=#{service_area}&food=#{food_id}&count=#{count}&start=#{start}&format=json"
    puts "REQUESTING %s" % url
    json = URI(url).read
    data = JSON.parse(json)
    shops = data['results']['shop']
    shops.each do |shop|
      item = {
        name: shop['name'],
        url: shop['photo']['pc']['l'],
        link_url: 'http://www.hotpepper.jp/str' + shop['id'],
        original_id: shop['id'],
      }
      p item
      Photo.create!(item)
    end

    results_returned = data['results']['results_returned'].to_i
    break if results_returned < count
    start += count
    sleep 1
  end
end
