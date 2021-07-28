class Coffee < ActiveRecord::Base
    has_many :orders
    has_many :customers, through: :orders

    def unique_customer_names
    self.customers.pluck(:name).uniq
    end

    def self.most_ordered
    self.all.max_by{|coffee| coffee.orders.length}
    end
end