# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "nokogiri"

# url = "https://www.trolley.co.uk/browse/household?page=1"


i = 1

until i == 10
  url = "https://www.trolley.co.uk/browse/household?page=#{i}"

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
i += 1
end
