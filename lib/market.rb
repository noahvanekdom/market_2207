class Market
    attr_reader :name, :vendors
    def initialize(name)
        @name = name
        @vendors = []
    end

    def add_vendor(vendor)
        @vendors << vendor
    end

    def vendor_names
        @vendors.map do |vendor|
            vendor.name
        end
    end

    def vendors_that_sell(item)
       array =  @vendors.select { |vendor| vendor.inventory.include?(item) }
    end


    def total_item_stocks
        total_item_hash = Hash.new(0)
        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|
                total_item_hash[item] += quantity
            end
        end
        total_item_hash
    end

    def overstocked_items
        total_item_stocks.select do |item, quantity|
            quantity > 50
        end
    end
end
