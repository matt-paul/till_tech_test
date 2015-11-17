require 'json'

class Till

  attr_reader :ordered_items, :menu

  def initialize
    @ordered_items = {}
    file = File.read('hipstercoffee.json')
    @menu = JSON.parse(file)
  end

  def add_items(item, qty = 1)
    raise 'Sorry, that item is not on the menu' if !on_menu?(item)
    if ordered_items.include?(item)
      ordered_items[item] += qty
    else
      ordered_items.store(item, qty)
    end
  end
  #
  # def subtotal
  #   # loop through our ordered_items hash and match key to our JSON file and
  #   # for each element, times the price by the quantity
  #   ordered_items.each do |item, qty|
  #
  #   end
  # end

private

  def on_menu?(item)
    menu[0]['prices'][0].include?(item)
  end

end
