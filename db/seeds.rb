require "open-uri"
require "nokogiri"

#user_list_seed

List.destroy_all
User.destroy_all

puts "creating new users and lists..."

lists = ["Home", "Parents", "Office", "Restaurant"]

i = 1
10.times do
  user = User.create!(email: "user#{i}@email.com", password: "password")
  List.create!(name: lists.sample, user_id: user.id)
  i += 1
end

puts "created #{User.count} users"
puts "created #{List.count} lists"

#product_seed

p = 1

until p == 10
  url = "https://www.trolley.co.uk/browse/household?page=#{p}"

  html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search(".product-item").each do |element|
  brand = element.css('._brand').text.strip
  item = element.css('._desc').text.strip
  image_code = element.attribute('data-id').value
  product = Product.new(
    item: item,
    brand: brand,
    image_url: "https://www.trolley.co.uk/img/product/#{image_code}"
    )
  product.save
end
puts "created #{Product.count} products"
p += 1
end
