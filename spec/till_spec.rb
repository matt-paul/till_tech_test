require 'order.rb'

describe Order do

  let(:order) { described_class.new }

  it 'should allow staff to add two menu items to the order' do
    order.add_items('Tiramisu')
    order.add_items('Affogato')
    expect(order.ordered_items).to eq({'Tiramisu'=>1, 'Affogato'=>1})
  end

  it 'should add the quantities of an item' do
    order.add_items('Tiramisu')
    order.add_items('Tiramisu')
    expect(order.ordered_items).to eq({'Tiramisu'=>2})
  end

  it 'should let staff know if an item is not on the menu' do
    expect{ order.add_items('Falafel', 3) }.to raise_error('Sorry, that item is not on the menu')
  end

  describe 'order calculation' do

    before(:each) do
      order.add_items('Tiramisu')
      order.add_items('Affogato')
    end

    it 'should calculate the subtotal of all items ordered' do
      expect(order.subtotal).to eq(26.20)
    end

    it 'calculates the correct tax amount based on the subtotal' do
      expect(order.tax).to eq(2.26)
    end

    it 'calculates the total amount that the customer should be charged' do
      expect(order.total).to eq(28.46)
    end

  end

end
