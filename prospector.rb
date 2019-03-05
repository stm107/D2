require_relative 'map.rb'
# prospector game logic
class Prospector
  attr_reader :character_name, :curr_location, :total_rubies, :total_fake_rubies, :map, :days, :turns
  def initialize(character_name)
    @map = Map.new
    @character_name = character_name
    @curr_location = @map.enum_can
    @total_rubies = 0
    @total_fake_rubies = 0
    @days = 0
    @turns = 0
    puts "Rubyist ##{character_name} starting in #{@curr_location.loc}."
  end

  # sets a new location to current.
  def change_curr_location(new_location)
    @curr_location = new_location
  end

  # search and print logic
  def prospect_search(total_turns)
    @days += 1
    rubies = rand(@curr_location.max_rubies + 1)
    fakes = rand(@curr_location.max_fake_rubies + 1)
    @total_rubies += rubies
    @total_fake_rubies += fakes
    # rubocop does not like the switch without [], this is one of my "freebies"
    case
    when rubies.zero? && fakes.zero?
      puts "\t\tFound no rubies or fake rubies in #{@curr_location.loc}."
      prospect_move(total_turns)
    when rubies == 1 && fakes != 1
      puts "\t\tFound #{rubies} ruby and #{fakes} fake rubies at #{@curr_location.loc}."
    when rubies != 1 && fakes == 1
      puts "\t\tFound #{rubies} rubies and #{fakes} fake ruby at #{@curr_location.loc}."
    when rubies == 1 && fakes == 1
      puts "\t\tFound #{rubies} ruby and #{fakes} fake ruby at #{@curr_location.loc}."
    else
      puts "\t\tFound #{rubies} rubies and #{fakes} fake rubies at #{@curr_location.loc}."
    end
  end

  # movement/turn logic includes the start location statment
  def prospect_move(total_turns)
    @turns += 1
    if @turns == total_turns
      end_search
    else
      neighbor_index = rand(@curr_location.neighbor_list.length)
      puts "Heading from #{@curr_location.loc} to #{@curr_location.neighbor_list[neighbor_index]}."
      change_curr_location(@map.get_by_name(@curr_location.neighbor_list[neighbor_index]))
    end
  end

  # end of game print logic that addresses grammar issues
  def end_search
    if @days == 1
      puts "After #{@days} day, Rubyist #{@character_name} found:"
    else
      puts "After #{@days} days, Rubyist #{@character_name} found:"
    end
    if @total_rubies == 1
      puts "\t\t#{@total_rubies} ruby."
    else
      puts "\t\t#{@total_rubies} rubies."
    end
    if @total_fake_rubies == 1
      puts "\t\t#{@total_fake_rubies} fake ruby."
    else
      puts "\t\t#{@total_fake_rubies} fake rubies."
    end
    if @total_rubies >= 10
      puts 'Going home victorious!'
    elsif @total_rubies.between?(1, 9)
      puts 'Going home sad.'
    elsif @total_rubies.zero?
      puts 'Going home empty-handed.'
    end
  end

  # runs until the prospector is out of turns will take the number of turns arg from command line
  def loop_prospector(total_turns)
    # Special case where total_turns is 0
    end_search if total_turns.zero?
    until @turns == total_turns
      # @turns is incremented in prospect search, when the conditions for a move are saisfied
      prospect_search(total_turns)
    end
  end
end
