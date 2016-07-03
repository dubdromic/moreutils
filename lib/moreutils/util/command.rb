Command = Struct.new(:string) do
  def output
    result[0]
  end

  def error
    result[1]
  end

  def error?
    error.length > 0
  end

  def return_value
    result[2].exitstatus
  end

  def returned_normally?
    return_value == 0
  end

  private

  def result
    @result ||= Open3.capture3(string)
  end
end
