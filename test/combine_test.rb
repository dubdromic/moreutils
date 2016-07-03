require 'test_helper'

module Moreutils
  class CombineTest < Minitest::Test
    def setup
      @one = ['One', 'Two', 'Three']
      @two = ['Two', 'Three', 'Four']
    end

    def test_and
      result = Moreutils::Combine::And.call(@one, @two)
      assert(result == ['Two', 'Three'])
    end

    def test_not
      result = Moreutils::Combine::Not.call(@one, @two)
      assert(result == ['One'])
    end

    def test_or
      result = Moreutils::Combine::Or.call(@one, @two)
      assert(result == ['One', 'Two', 'Three', 'Four'])
    end

    def test_xor
      result = Moreutils::Combine::Xor.call(@one, @two)
      assert(result == ['One', 'Four'])
    end
  end
end
