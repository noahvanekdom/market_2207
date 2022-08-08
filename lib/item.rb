class Item
    attr_reader :name, :price

    def initialize(attribute)
        @name = attribute[:name]
        @price = attribute[:price][1..-1].to_f
    end

end
