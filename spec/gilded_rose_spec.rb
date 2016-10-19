require 'gilded_rose'

describe GildedRose do

  QUALITY = 8
  NEGATIVE_QUALITY = 0
  SELL_IN = 4
  SELL_IN_BETWEEN_5_AND_10 = 7
  SELL_BY_DATE = 0

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "does not change the quality of the Sulfuras item" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", SELL_IN, QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq QUALITY
      expect(items[0].sell_in).to eq SELL_IN
    end

    it "ensures that aged brie increases in quality over time" do
      items = [Item.new("Aged Brie", SELL_IN, QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq QUALITY + 1
      expect(items[0].sell_in).to eq SELL_IN - 1
    end

    it "ensures that backstage passes increase by 3 with under 5 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", SELL_IN, QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq QUALITY + 3
      expect(items[0].sell_in).to eq SELL_IN - 1
    end

    it "ensures that backstage passes increase by 2 with over 5 days and under 10 days left" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", SELL_IN_BETWEEN_5_AND_10, QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq QUALITY + 2
      expect(items[0].sell_in).to eq SELL_IN_BETWEEN_5_AND_10 - 1
    end

    it "ensures that quality of item is never negative" do
      items = [Item.new("banana", SELL_IN, NEGATIVE_QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq NEGATIVE_QUALITY
      expect(items[0].sell_in).to eq SELL_IN - 1
    end

    it "ensures that quality of item degrades twice as fast after sell by date" do
      items = [Item.new("banana", SELL_BY_DATE, QUALITY)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
      expect(items[0].sell_in).to eq SELL_BY_DATE - 1
    end


  end

end
