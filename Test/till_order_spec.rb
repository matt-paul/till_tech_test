require 'till'

describe 'till' do

  let(:till){ described_class.new }

  it 'should allow staff to add two menu items to an order' do
    till.add_item('Tiramisu', 'Affogato')
    expect(till.ordered_items).to eq('Tiramisu', 'Affogato')
  end





end
