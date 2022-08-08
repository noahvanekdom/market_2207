require './lib/item'

describe Item do
    let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
    let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }

    describe 'initialize' do
        it 'has a name' do
            expect(item2.name).to eq 'Tomato'
        end

        it 'has a price' do
            expect(item2.price).to eq 0.5
        end
    end
end