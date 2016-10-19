require_relative 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def sort()
    @items.each do |item|
      if item.name == "Aged Brie"
        brie_calculator(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        concert_calculator(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        sulfaras_calculator(item)
      else
        normal_item(item)
      end
    end
  end

  def normal_item(item)
    reduce_quality(item)
  end

  def brie_calculator(item)
    reduce_quality(item)
    item.quality += 2
  end

  def concert_calculator(item)
    if item.quality > 50
      raise "Quality too high"
    elsif item.sell_in > 10
      item.quality += 1
      item.sell_in -= 1
    elsif (item.sell_in > 5) && (item.sell_in <= 10)
      item.quality += 2
      item.sell_in -= 1
    elsif (item.sell_in >= 0) && (item.sell_in <= 5)
      item.quality += 3
      item.sell_in -= 1
    elsif item.sell_in < 0
      item.quality = 0
      item.sell_in -= 1
    end
  end

  def sulfaras_calculator(item)

  end

  def reduce_quality(item)
    if item.quality > 50
      raise "Quality too high"
    else
      item.quality -= 1 if item.quality > 0
      item.sell_in -= 1
    end
  end


end
