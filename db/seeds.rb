require "open-uri"
require "nokogiri"

#user_list_seed

List.destroy_all
User.destroy_all

puts "-------------------------------------------------"
puts "creating new users..."
puts "-------------------------------------------------"

lists = ["Home", "Parents", "Office", "Restaurant"]

i = 1
10.times do
  user = User.create!(email: "user#{i}@email.com", password: "password")
  i += 1
end

puts "created #{User.count} users"
puts "-------------------------------------------------"
puts "creating new lists"
sleep(3.seconds)
puts "-------------------------------------------------"
puts "created #{List.count} lists"
puts "-------------------------------------------------"

#product_seed

puts "creating new products..."
puts "-------------------------------------------------"

product_categories = %w[household health-toiletries beauty-cosmetics]

# health & toiletries_seed

p = 1

until p == 50
  url = "https://www.trolley.co.uk/browse/health-toiletries?page=#{p}"

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
p += 1
end
health_toiletries = Product.count

puts "created #{health_toiletries} health & toiletries products"
puts "-------------------------------------------------"

# household seed

h = 1

until h == 50
  url = "https://www.trolley.co.uk/browse/household?page=#{h}"

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
h += 1
end
household = (Product.count) - health_toiletries

puts "created #{household} household products"
puts "-------------------------------------------------"

# beauty & cosmetics seed

b = 1

until b == 50
  url = "https://www.trolley.co.uk/browse/beauty-cosmetics?page=#{b}"

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
b += 1
end
beauty_cosmetics = (Product.count) - (health_toiletries + household)

puts "created #{beauty_cosmetics} beauty & cosmetics products"
puts "-------------------------------------------------"
puts "-------------------------------------------------"
sleep(4.seconds)
puts "#{Product.count} products stored in database"
puts "-------------------------------------------------"
