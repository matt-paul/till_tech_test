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

  # it 'should calculate the subtotal of all items ordered' do
  #   till.add_items('Tiramisu')
  #   till.add_items('Affogato')
  #   expect(till.subtotal).to eq(26.20)
  # end


end
