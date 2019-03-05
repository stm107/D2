require 'minitest/autorun'
require_relative 'arg_checker.rb'

class ArgsTest < Minitest::Test

  # UNIT TESTS FOR METHOD print_usage
  # This method takes no arguments, so there are no Equivalence classes.

  # Verify the output of the print_usage method
  def test_print_usage
  	@argCheck = ArgChecker.new
    assert_equal 'Usage:
ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*
*seed* should be an integer
*num_prospectors* should be a non-negative integer
*num_turns* should be a non-negative integer', @argCheck.print_usage
  end

  # UNIT TESTS FOR METHOD num_args(args)
  # Equivalence classes:
  # args.length == 0 -> method fails
  # args.length < 3 -> method fails
  # args.length > 3 -> method fails
  # args.length == 3 -> method passes

  # Pass an empty args list. Method should fail.
  # EDGE CASE
  def test_num_args_zero
  	args= []
  	ac = ArgChecker.new
  	refute ac.num_args(args)
  end
  # Pass an args list of size greater than zero but less than the expected size.
  # Method should fail.
  def test_num_args_less
  	args = [1]
  	ac = ArgChecker.new
  	refute ac.num_args(args)
  end
  # Pass an args list of size greater than expected. Method should fail.
  # EDGE CASE
  def test_num_args_more
  	args = [1, 1, 1, 1, 1]
  	ac = ArgChecker.new
  	refute ac.num_args(args)
  end
  # Pass a valid args list of size three, which is the expected size.
  # Method should not fail.
  def test_num_args_three
  	args = [1, 1, 1]
  	ac = ArgChecker.new
  	assert ac.num_args(args)
  end

  # UNIT TESTS FOR METHOD check_ints(args)
  # Equivalence classes:
  # one member of args list cannot be converted to an integer -> method fails
  # two members of args list cannot be converted to an integer -> method fails
  # no members of args list can be converted to integers -> method fails
  # all members of args list can be converted to integers -> method passes

  # Pass an args list with one string in it. Method should fail.
  def test_check_ints_one_string
  	args= [1, 2, true]
  	ac = ArgChecker.new
  	refute ac.check_ints(args)
  end
  # Pass an args list of size greater than zero but less than the expected size.
  # Method should fail.
  def test_check_ints_two_nonint
  	args = [1, "foo", true]
  	ac = ArgChecker.new
  	refute ac.check_ints(args)
  end
  # Pass an args list of size greater than expected. Method should fail.
  def test_check_ints_all_nonint
  	args = [true, "foo", "bar"]
  	ac = ArgChecker.new
  	refute ac.check_ints(args)
  end
  # Pass a valid args list of size three, which is the expected size.
  # Method should not fail.
  def test_check_ints
  	args = [1, 3, 1000]
  	ac = ArgChecker.new
  	assert ac.check_ints(args)
  end

  # UNIT TESTS FOR METHOD check_negatives(args)
  # Equivalence classes:
  # num_prospectors in negative -> method fails
  # num_turns is negative -> method fails
  # num_prospectors in zero -> method passes
  # num_turns is zero -> method passes
  # seed is negative -> passes

  # Pass an args list with num_prospectors as a negative int. Method should fail.
  # EDGE CASE
  def test_check_negatives_neg_pros
  	args= [1, -2, 3]
  	ac = ArgChecker.new
  	refute ac.check_negatives(args)
  end
  # Pass an args list with num_turns as a negative int. Method should fail.
  # EDGE CASE
  def test_check_negatives_neg_turns
  	args = [1, 2, -3]
  	ac = ArgChecker.new
  	refute ac.check_negatives(args)
  end
  # Pass an args list with num_prospectors as 0. Method should pass.
  def test_check_negtaives_zero_pros
  	args = [1, 0, 2]
  	ac = ArgChecker.new
  	assert ac.check_negatives(args)
  end
  # Pass an args list with num_turns as 0. Method should pass.
  def test_check_negatives_zero_turns
  	args = [1, 2, 0]
  	ac = ArgChecker.new
  	assert ac.check_negatives(args)
  end
  # Pass an args list with seed as a negative int. Method should pass.
  def test_check_negatives_zero_turns
  	args = [11, 2, 3]
  	ac = ArgChecker.new
  	assert ac.check_negatives(args)
  end
end