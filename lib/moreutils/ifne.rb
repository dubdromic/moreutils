require 'pry'

module Moreutils
  class Ifne
    def initialize(command, options = {})
      @command = command
      @run_if_empty = !!options[:inverse]
    end

    def run(stdin = STDIN)
      command.output if run_command?(stdin.read)
    end

    private

    attr_reader :command, :run_if_empty

    def run_command?(string)
      string.length == 0 && run_if_empty ||
        string.length > 0 && !run_if_empty
    end
  end
end
