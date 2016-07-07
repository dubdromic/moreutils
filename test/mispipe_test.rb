module Moreutils
  class MispipeTest < Minitest::Test
    def test_first_command_retval
      first_command = Command.new('(exit 2)') # It's turtle(shells) all the way down
      second_command = Command.new('ls')
      mispipe = Moreutils::Mispipe.new(first_command, second_command)
      assert(mispipe.run == 2)
    end
  end
end
