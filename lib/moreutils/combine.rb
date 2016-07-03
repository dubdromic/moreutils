module Moreutils
  class Combine
    class And
      def self.call(one, two)
        one & two
      end
    end

    class Not
      def self.call(one, two)
        one - two
      end
    end

    class Or
      def self.call(one, two)
        one | two
      end
    end

    class Xor
      def self.call(one, two)
        Or.call(
          Not.call(one, two),
          Not.call(two, one)
        )
      end
    end

    OPERATIONS = {
      and: Combine::And,
      not: Combine::Not,
      or: Combine::Or,
      xor: Combine::Xor
    }

    def initialize(operation, one, two)
      @operation = operation
      @one = one
      @two = two
    end

    def print(stdout = STDOUT)
      OPERATIONS[operation.to_sym].call(one, two).each do |line|
        stdout.puts line
      end
    end

    private

    attr_reader :operation, :one, :two
  end
end
