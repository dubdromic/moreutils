require 'open3'

module Moreutils
  class Chronic
    def initialize(command, options = {})
      @command = command
      @verbose = !!options[:verbose]
      @error_trigger = !!options[:error_trigger]
    end

    def print(stdout = STDOUT, stderr = STDERR)
      return if command_successful?
      if verbose
        stdout.print verbose_output
      else
        stdout.print command.output
        stderr.print command.error
      end
    end

    private

    attr_reader :command, :verbose, :error_trigger

    def command_successful?
      error_trigger ? !command.error? : command.returned_normally?
    end

    def verbose_output
      result = [
        "STDOUT:\n#{command.output}",
        "STDERR:\n#{command.error}",
        "RETVAL: #{command.return_value}",
      ]
      result.join("\n") + "\n"
    end
  end
end
