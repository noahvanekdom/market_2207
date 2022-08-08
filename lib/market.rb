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


    def total_inventory
        total_item_hash = Hash.new {|hash, key| hash[key] = {quantity: 0, vendors: []}}
        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|
                total_item_hash[item][:quantity] += quantity
                total_item_hash[item][:vendors] << vendor
            end
        end
        total_item_hash
    end

    def overstocked_items
        total_inventory.keys.select do |item|
          total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].length > 1
        end
    end

    def sorted_item_list
        total_inventory.keys.map do |inventory_item|
            inventory_item.name
        end.sort!
    end
end
