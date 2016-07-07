module Moreutils
  class Mispipe
    def initialize(first_command, second_command)
      @first_command = first_command
      @second_command = second_command
    end

    def run
      result = pipeline_commands
      result.first.exitstatus
    end

    private

    attr_reader :first_command, :second_command

    def pipeline_commands
      Open3.pipeline(first_command.string, second_command.string)
    end
  end
end
