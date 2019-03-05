require_relative 'arg_checker.rb'
require_relative 'map.rb'
require_relative 'prospector.rb'

ac = ArgChecker.new
ac.print_usage & exit(1) unless ac.num_args(ARGV)
ac.print_usage & exit(1) unless ac.check_ints(ARGV)
ac.print_usage & exit(1) unless ac.check_negatives(ARGV)
# seeds the random number generator with the second arg
srand(Integer(ARGV[0]))
# game loop
num_prospectors = 1
until num_prospectors == Integer(ARGV[1]) + 1
  pro = Prospector.new(num_prospectors)
  num_prospectors += 1
  pro.loop_prospector(Integer(ARGV[2]))
end
exit(0)
