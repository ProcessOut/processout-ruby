module ProcessOut
  class GenericError < StandardError
    attr_accessor :code
    def initialize(code, msg)
      self.code = code
      super(msg)
    end
  end
end
