  # Stub map.location for search, 0 possible gems returns 0.
  # Stub map.location for name, verify that name is returned.
  # Stub map.location for neighbors, one neighbor is the only place to go on move.
  # Stub map.location for neighbros, no neighbors is a failure.

require 'minitest/autorun'
require_relative 'Prospector.rb'

class ProspectorTest < Minitest::Test

  # UNIT TESTS FOR METHOD initialize
  # Equivalence classes:
  # character name is "Bill Laboon" -> returns prospector with name "Bill Laboon"
  # character name is "1" -> returns prospector with name 1.

  # Verify the output of the initialize method with name "Bill Laboon"
  def test_initialize_prospector_bill
  	pro = Prospector.new("Bill Laboon")
  	assert pro.character_name == "Bill Laboon"
  	refute pro.map == nil
  	assert pro.curr_location == pro.map.enum_can
  	assert pro.total_rubies == 0
  	assert pro.total_fake_rubies == 0
  	assert pro.days == 0
  	assert pro.turns == 0
  end

  # Verify the output of the initialize method with name 1
  def test_initialize_prospector_one
  	pro = Prospector.new(1)
  	assert pro.character_name == 1
  	refute pro.map == nil
  	assert pro.curr_location == pro.map.enum_can
  	assert pro.total_rubies == 0
  	assert pro.total_fake_rubies == 0
  	assert pro.days == 0
  	assert pro.turns == 0
  end

  # UNIT TESTS FOR METHOD set_curr_location(new_location)
  # Equivalence classes:
  # Set curr_location as any new location -> curr_location contains specified attributes
  # Set curr_location as nil -> curr_location is nil

  # Create a location called "Laboon Lake". 
  # Verify that curr_location is set with Laboon Lake's attributes.
  # STUB
  def test_change_curr_location_any
  	location_stub = Minitest::Mock.new('Mock Location')
  	pro = Prospector.new(1)
  	def location_stub.loc
      "Laboon Lake"
    end
    def location_stub.max_rubies
      1
    end
    def location_stub.max_fake_rubies
      1
    end
    def location_stub.neighbor_list
      ["Sean's Bowser Castle", "Kitty's Cozy Condo"]
    end
    pro.change_curr_location(location_stub)
    assert pro.curr_location.loc == "Laboon Lake"
    assert pro.curr_location.max_rubies == 1
    assert pro.curr_location.max_fake_rubies == 1
    assert pro.curr_location.neighbor_list.length == 2
    assert pro.curr_location.neighbor_list.include? "Sean's Bowser Castle"
    assert pro.curr_location.neighbor_list.include? "Kitty's Cozy Condo"
  end
 
  # Verify that curr_location is set to nil if nil is passed.
  # EDGE CASE
  def test_change_curr_location_nil
  	pro = Prospector.new(1)
  	pro.change_curr_location(nil)
  	assert pro.curr_location == nil
  end

  # UNIT TESTS FOR METHOD prospect_search(total_turns)
  # Equivalence classes:
  # Set curr_location as location with no available rubies and total_turns > 0 -> no rubies are found.
  # Set curr_location as location with no fake rubies and total_turns > 0 -> no fake rubies are found.
  # Set curr_location as location with no rubies nor fake rubies and total_turns > 0 -> no rubies nor fake rubies are found. Prospector moves.
  # total_turns is 0 -> end_search is called.
  
  # Create a location with no max_rubies and verify that no rubies are found.
  # STUB
  def test_prospect_search_no_rubies
  	location_stub = Minitest::Mock.new('Mock Location')
  	pro = Prospector.new(1)
  	def location_stub.loc
      "Laboon Lake"
    end
    def location_stub.max_rubies
      0
    end
    def location_stub.max_fake_rubies
      1
    end
    def location_stub.neighbor_list
      ["Sean's Bowser Castle", "Kitty's Cozy Condo"]
    end
    pro.change_curr_location(location_stub)
    pro.prospect_search(1)
    assert pro.total_rubies == 0
  end

  # Create a location with no max_fake_rubies and verify that no fake rubies are found.
  # STUB
  def test_prospect_search_no_fakes
  	location_stub = Minitest::Mock.new('Mock Location')
    pro = Prospector.new(1)
    def location_stub.loc
      "Laboon Lake"
    end
    def location_stub.max_rubies
      1
    end
    def location_stub.max_fake_rubies
      0
    end
    def location_stub.neighbor_list
      ["Sean's Bowser Castle", "Kitty's Cozy Condo"]
    end
    pro.change_curr_location(location_stub)
    pro.prospect_search(1)
    assert pro.total_fake_rubies == 0
  end

  def test_prospect_search_no_rubies_fakes
  	location_stub = Minitest::Mock.new('Mock Location')
  	pro = Prospector.new(1)
  	def location_stub.loc
      "Laboon Lake"
    end
    def location_stub.max_rubies
      0
    end
    def location_stub.max_fake_rubies
      0
    end
    def location_stub.neighbor_list
      ["Dynamic Palisades", "Enumerable Canyon"]
    end
    pro.change_curr_location(location_stub)
    pro.prospect_search(2)
    assert pro.total_rubies == 0
    refute pro.curr_location.loc == "Laboon Lake"
  end

  # UNIT TESTS FOR METHOD prospect_move(total_turns)
  # Equivalence classes:
  # total_turns is 1 -> end_search is called.
  # Set curr_location as a location with no neighbors -> stays at current location

  # Test that when the number of total turns is 1, end_search is called
  def test_total_turns_1
  	pro = Prospector.new(1)
  	pro.prospect_move(1)
  	assert pro.total_rubies == 0
  	assert pro.total_fake_rubies == 0
  end 
  # Create a location with no neighbors and verify that curr_location stays the same.
  # STUB
  def test_prospect_move_no_neighbors
  	location_stub = Minitest::Mock.new('Mock Location')
  	pro = Prospector.new(1)
  	def location_stub.loc
      "Laboon Lake"
    end
    def location_stub.max_rubies
      1
    end
    def location_stub.max_fake_rubies
      1
    end
    def location_stub.neighbor_list
      []
    end
    pro.change_curr_location(location_stub)
    assert pro.curr_location.loc == "Laboon Lake"
  end
  
  # UNIT TESTS FOR METHOD loop_prospector(total_turns)
  # Equivalence classes: 
  # total_turns is 0 -> end_search is called immendiately.
  # STUB
  def test_end_search_0_turns
  	pro = Prospector.new(1)
  	pro.loop_prospector(0)
  	assert pro.total_rubies == 0
  	assert pro.total_fake_rubies == 0
  	assert pro.days == 0
  	assert pro.turns == 0
  end 

end