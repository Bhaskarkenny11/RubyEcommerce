

100.times do
    product = Product.new
    product.name = Faker::Commerce.product_name
    product.price = Faker::Commerce.price(10.1000)
    product.description = Faker::Lorem.paragraph
    product.stock = Faker::Number.number(3)
    product.code_eligibility = [true,false].sample
    product.category_id = Category.all.sample.id
    product.save
end
  