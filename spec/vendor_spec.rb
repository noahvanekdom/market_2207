require './lib/item'
require './lib/vendor'

describe Vendor do
    let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
    let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
    let(:vendor) { Vendor.new("Rocky Mountain Fresh") }

    describe 'initialize' do
        it 'has a name' do
            expect(vendor.name).to eq "Rocky Mountain Fresh"
        end

        it 'has an empty hash for storing inventory' do
            expect(vendor.inventory).to eq({})
        end
    end

    describe 'check_stock(item)' do

        context 'when item stock is empty' do
            it 'returns 0' do
                expect(vendor.check_stock(item1)).to eq 0
            end
        end
    end

    describe 'stock' do
        before do
            vendor.stock(item1, 30)
        end

        it 'adds items to the vendor inventory hash' do
            expect(vendor.inventory).to eq({item1 => 30})
        end

        it 'changes the value of check_stock for the item' do
            expect(vendor.check_stock(item1)).to eq 30
        end

        it 'can do so when there is existing inventory' do
            vendor.stock(item1, 25)
            vendor.stock(item2, 12)
            expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
        end
    end
end
