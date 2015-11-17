class Till

  attr_reader :ordered_items

  def initialize
    @ordered_items = {}
  end

  def add_items(item, qty = 1)
    ordered_items.store(item, qty)
  end



end
