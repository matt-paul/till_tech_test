require 'till.rb'

describe Till do

  let(:till) { described_class.new }

  it 'should allow staff to add two menu items to the order' do
    till.add_items('Tiramisu')
    till.add_items('Affogato')
    expect(till.ordered_items).to eq({'Tiramisu'=>1, 'Affogato'=>1})
  end

  it 'should add the quantities of an item' do
    till.add_items('Tiramisu')
    till.add_items('Tiramisu')
    expect(till.ordered_items).to eq({'Tiramisu'=>2})
  end

  it 'should let staff know if an item is not on the menu' do
    expect{ till.add_items('Falafel', 3) }.to raise_error('Sorry, that item is not on the menu')
  end

  it 'should calculate the subtotal of all items ordered' do
    till.add_items('Tiramisu')
    till.add_items('Affogato')
    expect(till.subtotal).to eq(26.20)
  end

  it 'calculates the correct tax amount based on the subtotal' do
    till.add_items('Tiramisu')
    till.add_items('Affogato')
    expect(till.tax).to eq(2.26)
  end

  it 'calculates the total amount that the customer should be charged' do
    till.add_items('Tiramisu')
    till.add_items('Affogato')
    expect(till.total).to eq(28.46)
  end


end
