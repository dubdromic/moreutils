require 'test_helper'

module Moreutils
  class ChronicTest < Minitest::Test
    def test_good_command_is_quiet
      command = Command.new 'true'
      chronic = Moreutils::Chronic.new command
      assert_output('', '') { chronic.print }
    end

    def test_bad_command_is_loud
      command = Command.new 'ls -8'
      chronic = Moreutils::Chronic.new command
      assert_output('', /invalid/) { chronic.print($stdout, $stderr) }
    end

    def test_verbose_good_command_is_quiet
      command = Command.new 'true'
      chronic = Moreutils::Chronic.new(command, verbose: true)
      assert_output('', '') { chronic.print }
    end

    def test_verbose_bad_command_is_loud
      command = Command.new 'ls -8'
      chronic = Moreutils::Chronic.new(command, verbose: true)
      assert_output(/STDOUT/, nil) { chronic.print($stdout, $stderr) }
    end

    # Stub command.error? to test if error_trigger is being checked
    # This "knows" about the logic; perhaps Command can make this
    # decision?
    def test_error_trigger_flag_uses_error_presence
      command = TestCommand.new
      chronic = Moreutils::Chronic.new(command, error_trigger: true)
      assert_output('', '') { chronic.print }
    end

    class TestCommand
      def error?
        false
      end
    end
  end
end
