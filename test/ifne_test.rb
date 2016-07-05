require 'test_helper'

module Moreutils
  class IfneTest < Minitest::Test
    def test_runs_when_stdin_present
      input_stream = StringIO.new 'test'
      command = Command.new 'echo -n hi'
      ifne = Moreutils::Ifne.new(command)
      result = ifne.run(input_stream)
      assert(result == 'hi')
    end

    def test_nothing_when_stdin_empty
      input_stream = StringIO.new
      command = Command.new 'echo hi'
      ifne = Moreutils::Ifne.new(command)
      result = ifne.run(input_stream)
      assert(result == nil)
    end

    def test_inverse_nothing_when_stdin_present
      input_stream = StringIO.new 'test'
      command = Command.new 'echo hi'
      ifne = Moreutils::Ifne.new(command, inverse: true)
      result = ifne.run(input_stream)
      assert(result == nil)
    end

    def test_inverse_runs_when_stdin_empty
      input_stream = StringIO.new ''
      command = Command.new 'echo -n hi'
      ifne = Moreutils::Ifne.new(command, inverse: true)
      result = ifne.run(input_stream)
      assert(result == 'hi')
    end
  end
end
