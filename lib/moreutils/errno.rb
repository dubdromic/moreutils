module Moreutils
  class Errno
    FormattedErrno = Struct.new(:constant, :number, :description) do
      def string_from_code
        [number, description].join(' ')
      end

      def string_from_number
        [constant, description].join(' ')
      end
    end

    FORMATTED_ERRORS = ::Errno.constants.reduce({}) do |result, code|
      constant = ::Errno.const_get(code)
      number = constant::Errno
      description = constant.exception.to_s
      result.merge!(number => FormattedErrno.new(constant, number, description))
    end

    def self.all
      FORMATTED_ERRORS.map { |k, v| "#{k} #{v.string_from_number}" }
    end

    def self.by_code(code)
      result = FORMATTED_ERRORS.select { |_, v| v.constant.to_s == code }.values.first
      result.string_from_code if result
    end

    def self.by_number(number)
      result = FORMATTED_ERRORS[number.to_i]
      result.string_from_number if result
    end

    def self.search(needle)
      result = FORMATTED_ERRORS.select { |_, v| Regexp.new(needle) =~ v.description }.values.first
      result.string_from_number if result
    end
  end
end
