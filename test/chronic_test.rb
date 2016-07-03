require 'test_helper'

module Moreutils
  class ChronicTest < Minitest::Test
    def test_successful_command_is_quiet
      result = Moreutils::Chronic.call 'true'
      assert(result == '')
    end

    def test_unsuccessful_command_is_loud
      result = Moreutils::Chronic.call 'ls -8'
      assert(result =~ /invalid/)
    end

    def test_verbose_successful_command_is_quiet
      result = Moreutils::Chronic.call('true', verbose: true)
      assert(result == '')
    end

    def test_verbose_unsuccessful_command_is_loud
      result = Moreutils::Chronic.call('ls -8', verbose: true)
      assert(result =~ /STDOUT:\n/)
      assert(result =~ /STDERR:\n.*invalid/)
      assert(result =~ /RETVAL: 2/)
    end
  end
end
