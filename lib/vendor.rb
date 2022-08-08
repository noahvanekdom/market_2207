class Vendor
    attr_reader :name, :inventory
    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def stock(item, quantity)
        @inventory[item] += quantity
    end

    def check_stock(item)
        @inventory[item]
    end

    def potential_revenue
        revenue_array = []
        @inventory.each do |item, quantity|
            revenue_array << (item.price * quantity)
        end
        revenue_array.sum
    end
end
