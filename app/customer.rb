class Customer < ActiveRecord::Base
    has_many :orders
    has_many :coffees, through: :orders 

    def self.names
    Customer.pluck(:name)
    end

    def order_coffee(coffee_title, price)
    coffee = Coffee.find_by(title: coffee_title)
    order = Order.create(coffee_id: coffee.id, customer_id: self.id, price: price)
    order.receipt
    end

    def total_purchases_amount
    binding.pry
    self.orders.sum(:price)
    end

   def dislike_coffee(coffee)
    order = self.orders.where("coffee_id=?",coffee.id).last.destroy
    puts "#{self.name} has been refunded $#{order.price}"
   end
end