require 'json'

class Order

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

  def subtotal
    ordered_items.map { |item, qty| menu[0]['prices'][0][item] * qty}.reduce(:+).round(2)
  end

  def tax
    (subtotal * 0.0864).round(2)
  end

  def total
    subtotal + tax
  end

private

  def on_menu?(item)
    menu[0]['prices'][0].include?(item)
  end

end
