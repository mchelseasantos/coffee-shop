Order.destroy_all
Customer.destroy_all
Coffee.destroy_all

5.times do
Customer.create(name: Faker::Name.name)
end

5.times do
Coffee.create(title: Faker::Coffee)
end

20.times do
Order.create(price: rand(1..10) , coffee_id: Coffee.all.sample.id, order_id: Customer.ids.sample)
end



