require 'json'
file = File.read('hipstercoffee.json')
menu = JSON.parse(file)

class Till


  attr_reader :ordered_items

  def initialize
    @ordered_items = {}
  end

  def add_items(item, qty = 1)
    if ordered_items.include?(item)
      ordered_items[item] += qty
    else
      ordered_items.store(item, qty)
    end
  end



end
