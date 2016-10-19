require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != ("Aged Brie" || "Backstage passes to a TAFKAL80ETC concert" || "Sulfuras, Hand of Ragnaros")
        item.quality -= 1
        item.sell_in -= 1
      end
    end
  end
end
