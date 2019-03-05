# creates the game map
class Map
  attr_reader :enum_can, :mp_city, :dt_beach, :nil_town, :hash_cross, :matzburg, :dyn_pals
  def initialize
    @enum_can = Location.new('Enumerable Canyon', 1, 1, ['Duck Type Beach', 'Monkey Patch City'])
    @dt_beach = Location.new('Duck Type Beach', 2, 2, ['Enumerable Canyon', 'Matzburg'])
    @mp_city = Location.new('Monkey Patch City', 1, 1, ['Nil Town', 'Enumerable Canyon', 'Matzburg'])
    @nil_town = Location.new('Nil Town', 0, 3, ['Monkey Patch City', 'Hash Crossing'])
    @matzburg = Location.new('Matzburg', 3, 0, ['Duck Type Beach', 'Monkey Patch City',
                                                'Hash Crossing', 'Dynamic Palisades'])
    @hash_cross = Location.new('Hash Crossing', 2, 2, ['Matzburg', 'Nil Town', 'Dynamic Palisades'])
    @dyn_pals = Location.new('Dynamic Palisades', 2, 2, ['Matzburg', 'Hash Crossing'])
  end

  def get_by_name(city)
    return @enum_can if city == 'Enumerable Canyon'
    return @dt_beach if city == 'Duck Type Beach'
    return @mp_city if city == 'Monkey Patch City'
    return @nil_town if city == 'Nil Town'
    return @matzburg if city == 'Matzburg'
    return @hash_cross if city == 'Hash Crossing'
    return @dyn_pals if city == 'Dynamic Palisades'
  end

  # location attributes
  class Location
    attr_reader :loc, :max_rubies, :max_fake_rubies, :neighbor_list
    def initialize(loc, max_rubies, max_fake_rubies, neighbor_list)
      @loc = loc
      @max_rubies = max_rubies
      @max_fake_rubies = max_fake_rubies
      @neighbor_list = neighbor_list
    end
  end
end
