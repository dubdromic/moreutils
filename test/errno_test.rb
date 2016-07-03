require 'test_helper'

module Moreutils
  class ErrnoTest < Minitest::Test
    def test_find_by_code
      result = Moreutils::Errno.by_code 'Errno::ENOENT'
      assert(result == '2 No such file or directory')
    end

    def test_find_by_number
      result = Moreutils::Errno.by_number 2
      assert(result == 'Errno::ENOENT No such file or directory')
    end

    def test_search_descriptions
      result = Moreutils::Errno.search 'No such'
      assert(result == 'Errno::ENOENT No such file or directory')
    end
  end
end
