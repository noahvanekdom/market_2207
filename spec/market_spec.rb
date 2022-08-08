require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
   let(:market) { Market.new("South Pearl Street Farmers Market") }
   let(:vendor1) { Vendor.new("Rocky Mountain Fresh") }
   let(:vendor2) { Vendor.new("Ba-Nom-a-Nom") }
   let(:vendor3) { Vendor.new("Palisade Peach Shack") }
   let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
   let(:item2) { Item.new({name: 'Tomato', price: "$0.50"}) }
   let(:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
   let(:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }

   before do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)
   end

    describe 'initialize' do
        it 'has a name' do
            expect(market.name).to eq "South Pearl Street Farmers Market"
        end

        it 'has an empty array for storing vendors' do
            expect(market.vendors).to eq []
        end
    end

    describe 'add_vendor' do
        before do
            market.add_vendor(vendor1)
            market.add_vendor(vendor2)
            market.add_vendor(vendor3)
        end

        it 'adds vendors to the vendors array' do
            expect(market.vendors).to eq [vendor1, vendor2, vendor3]
        end

        it 'changes the value of vendor_names' do
            expect(market.vendor_names).to eq ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
        end
    end

    describe 'vendors_that_sell(item)' do
        before do
            market.add_vendor(vendor1)
            market.add_vendor(vendor2)
            market.add_vendor(vendor3)
        end

        it 'returns a list of vendors that sell the given item' do
            expect(market.vendors_that_sell(item1)).to eq [vendor1, vendor3]
        end
    end

    describe 'vendor #potential_revenue' do
        it 'returns the amount a vendor would make by selling all their items' do
            expect(vendor1.potential_revenue).to eq 29.75
            expect(vendor2.potential_revenue).to eq 345.00
            expect(vendor3.potential_revenue).to eq 48.75
        end
    end

    describe 'total_inventory' do
        before do
            market.add_vendor(vendor1)
            market.add_vendor(vendor2)
            market.add_vendor(vendor3)
        end
        it 'returns a hash where the keys are items, and the values are a nested hash' do
            vendor3.stock(item3, 10)
            expect(market.total_inventory).to eq({
                item1 => {
                    quantity: 100,
                    vendors: [vendor1]
                         },
                item2 => {
                    quantity: 7,
                    vendors: [vendor1, vendor2]
                         },
                item3 => {
                    quantity: 50,
                    vendors: [vendor2]
                        },
                item4 => {
                    quantity: 35,
                    vendors: [vendor2]
                        } })
        end
    end

    describe 'overstocked_items' do
        before do
            market.add_vendor(vendor1)
            market.add_vendor(vendor2)
            market.add_vendor(vendor3)
        end
        it 'returns an array of all overstocked items (vendors > 1, total quantity > 50)' do
            expect(market.overstocked_items).to eq([item1])
        end
    end

    describe 'sorted_item_list' do
        before do
            market.add_vendor(vendor1)
            market.add_vendor(vendor2)
            market.add_vendor(vendor3)
        end
        it 'returns an array of items sorted alphabetically' do
            expect(market.sorted_item_list).to eq ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"]
        end
    end
end

