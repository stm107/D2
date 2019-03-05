require 'minitest/autorun'
require_relative 'map.rb'

class MapTest < Minitest::Test

  def setup
    @map = Map.new
  end
  # UNIT TESTS FOR METHOD initialize
  # This method takes no arguments, so there are no Equivalence classes.

  # Verify the output of the initialize method
  def test_initialize_map
    assert @map.enum_can.loc == "Enumerable Canyon"
    assert @map.dt_beach.loc == "Duck Type Beach"
    assert @map.mp_city.loc == "Monkey Patch City"
    assert @map.nil_town.loc == "Nil Town"
    assert @map.matzburg.loc == "Matzburg"
    assert @map.hash_cross.loc == "Hash Crossing"
    assert @map.dyn_pals.loc == "Dynamic Palisades"
  end

  # UNIT TESTS FOR METHOD get_by_name(name)
  # Equivalence classes:
  # Name is "Enumerable Canyon" -> method returns Location info for Enumerable Canyon
  # Name is "Duck Type Beach" -> method returns Location info for Duck Type Beach
  # Name is "Monkey Patch City" -> method returns Location info for Monkey Patch City
  # Name is "Nil Town" -> method returns Location info for Nil Town
  # Name is "Matzburg" -> method returns Location info for Matzburg
  # Name is "Hash Crossing" -> method returns Location info for Hash Crossing
  # Name is "Dynamic Palisades" -> method returns Location info for Dynamic Palisades
  # Name is something else -> method returns nil.

  # Pass "Enumerable Canyon" as name.
  # Method should return location info for Enumerable Canyon.
  def test_get_by_name_enumcanyon
    location = @map.get_by_name("Enumerable Canyon")
    assert location.loc == "Enumerable Canyon"
    assert location.max_rubies == 1
    assert location.max_fake_rubies == 1
    assert location.neighbor_list.length == 2
    assert location.neighbor_list.include? "Duck Type Beach"
    assert location.neighbor_list.include? "Monkey Patch City"
  end

  # Pass "Duck Type Beach" as name.
  # Method should return location info for Duck Type Beach.
  def test_get_by_name_dtbeach
    location = @map.get_by_name("Duck Type Beach")
    assert location.loc == "Duck Type Beach"
    assert location.max_rubies == 2
    assert location.max_fake_rubies == 2
    assert location.neighbor_list.length == 2
    assert location.neighbor_list.include? "Enumerable Canyon"
    assert location.neighbor_list.include? "Matzburg"
  end

  # Pass "Monkehy Patch City" as name.
  # Method should return location info for Monkey Patch City
  def test_get_by_name_mpcity
    location = @map.get_by_name("Monkey Patch City")
    assert location.loc == "Monkey Patch City"
    assert location.max_rubies == 1
    assert location.max_fake_rubies == 1
    assert location.neighbor_list.length == 3
    assert location.neighbor_list.include? "Enumerable Canyon"
    assert location.neighbor_list.include? "Matzburg"
    assert location.neighbor_list.include? "Nil Town"
  end

  # Pass "Nil Town" as name.
  # Method should return location info for Nil Town
  def test_get_by_name_niltown
    location = @map.get_by_name("Nil Town")
    assert location.loc == "Nil Town"
    assert location.max_rubies == 0
    assert location.max_fake_rubies == 3
    assert location.neighbor_list.length == 2
    assert location.neighbor_list.include? "Monkey Patch City"
    assert location.neighbor_list.include? "Hash Crossing"
  end

  # Pass "Matzburg" as name.
  # Method should return location info for Matzburg
  def test_get_by_name_matzburg
    location = @map.get_by_name("Matzburg")
    assert location.loc == "Matzburg"
    assert location.max_rubies == 3
    assert location.max_fake_rubies == 0
    assert location.neighbor_list.length == 4
    assert location.neighbor_list.include? "Duck Type Beach"
    assert location.neighbor_list.include? "Monkey Patch City"
    assert location.neighbor_list.include? "Dynamic Palisades"
    assert location.neighbor_list.include? "Hash Crossing"
  end

  # Pass "Hash Crossing" as name.
  # Method should return location info for Hash Crossing
  def test_get_by_name_hcrossing
    location = @map.get_by_name("Hash Crossing")
    assert location.loc == "Hash Crossing"
    assert location.max_rubies == 2
    assert location.max_fake_rubies == 2
    assert location.neighbor_list.length ==3
    assert location.neighbor_list.include? "Matzburg"
    assert location.neighbor_list.include? "Nil Town"
    assert location.neighbor_list.include? "Dynamic Palisades"
  end

  # Pass "Dynamic Palisades" as name.
  # Method should return location info for Dynamic Palisades
  def test_get_by_name_dpalisades
    location = @map.get_by_name("Dynamic Palisades")
    assert location.loc == "Dynamic Palisades"
    assert location.max_rubies == 2
    assert location.max_fake_rubies == 2
    assert location.neighbor_list.length == 2
    assert location.neighbor_list.include? "Hash Crossing"
    assert location.neighbor_list.include? "Matzburg"
  end

  # Pass "Bayou Laboon" as name.
  # Method should return nil (Bayou Laboon is not on the map)
  # EDGE CASE
  def test_get_by_name_fake
    location = @map.get_by_name("Bayou Laboon")
    assert location == nil
  end

  # UNIT TESTS FOR METHOD initialize (Location)
  # Equivalence classes:
  # Name is "Bayou Laboon", max_rubies is 10, max_fake rubies is 10,
  # neighbor_list is an empty list -> method returns new location with
  # previously specified attributes.
  def test_initialize_location
    location = Map::Location.new("Bayou Laboon", 10, 10, [])
    assert location.loc == "Bayou Laboon"
    assert location.max_rubies == 10
    assert location.max_fake_rubies == 10
    assert location.neighbor_list.length == 0
    refute location.neighbor_list.include? "Sean's Bowser Castle"
  end
end