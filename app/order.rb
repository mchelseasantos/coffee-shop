class Order < ActiveRecord::Base
    belongs_to :coffee
    belongs_to :customer

    def receipt
    puts "#{self.customer.name} ordered a #{self.coffee.title} for $#{self.price}"
    end
end