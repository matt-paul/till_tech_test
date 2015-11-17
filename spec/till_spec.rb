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


end
