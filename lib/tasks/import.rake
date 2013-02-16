desc 'Import master data'
task import: :environment do
  Dir['db/*.json'].each do |path|
    json = File.read(path)
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
  end
end
