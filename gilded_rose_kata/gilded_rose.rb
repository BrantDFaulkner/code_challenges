def update_quality(items)
  items.each do |item|
    unless item.name =~ /Sulfuras/
      case item.name
      when /Brie/
        update_aged_brie_quality(item)
      when /Backstage/
        update_backstage_pass_quality(item)
      when /Conjured/
        update_conjured_quality(item)
      else
        update_normal_quality(item)
      end
      validate_quality(item)
      decrement_sell_in(item)
    end
  end
end

def decrement_sell_in(item)
  item.sell_in -= 1
end

def validate_quality(item)
  if item.quality < 0
    item.quality = 0
  elsif item.quality > 50
    item.quality = 50
  end
end

def update_normal_quality(item)
  item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2
end

def update_aged_brie_quality(item)
  item.sell_in <= 0 ? item.quality += 2 : item.quality += 1
end

def update_backstage_pass_quality(item)
  if item.sell_in <= 0
    item.quality = 0
  elsif item.sell_in <= 5
    item.quality += 3
  elsif item.sell_in <= 10
    item.quality += 2
  else
    item.quality += 1
  end
end

def update_conjured_quality(item)
  if item.sell_in <= 0
    item.quality -=4
  else
    item.quality -= 2
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]

