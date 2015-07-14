class ErrorObject
  def initialize(message)
    @message = message
  end

  def valid?
    false
  end

  def to_s
    "Error: #{@message}"
  end
end
