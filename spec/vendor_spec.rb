require './lib/item'
require './lib/vendor'

describe Vendor do
    let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
    let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }

    describe 'initialize' do
        it 'has a name' do
        end

        it 'has a price' do
        end


end
