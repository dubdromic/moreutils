require 'open3'

module Moreutils
  class Chronic
    def self.call(command = nil, options = {})
      new(command, options).call
    end

    def initialize(command = nil, options = {})
      @command = command
      @verbose = !!options[:verbose]
      @error_trigger = !!options[:error_trigger]
    end

    def call
      run_command
      return '' if command_successful? 
      verbose ? verbose_result : error
    end

    private

    attr_reader :command, :verbose, :error_trigger, :out, :error, :process

    def run_command
      @out, @error, @process = Open3.capture3 command
    end

    def command_successful?
      error_trigger ? error.to_s.length > 0 : retval == 0
    end

    def retval
      process.exitstatus.to_i
    end

    def verbose_result
      output = [
        "STDOUT:\n#{out}",
        "STDERR:\n#{error}",
        "RETVAL: #{process.exitstatus}"
      ]
      output.join("\n")
    end
  end
end
