# Checks command line arguments
class ArgChecker
  def print_usage
    usage = 'Usage:
ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*
*seed* should be an integer
*num_prospectors* should be a non-negative integer
*num_turns* should be a non-negative integer'
    puts usage
    return usage
  end

  def num_args(args)
    args.length == 3
  end

  def check_ints(args)
    Integer(args[0])
    Integer(args[1])
    Integer(args[2])
  rescue StandardError
    false
  end

  def check_negatives(args)
    Integer(args[1]) >= 0 && Integer(args[2]) >= 0
  end
end
